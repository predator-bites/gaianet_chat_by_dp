#!/bin/bash

echo " "
read -p "Enter your domain name (example - droppredator): " DOMAIN
read -p "Enter your api key: " API_KEY
read -p "Enter amount of threads to run: " THREADS_AMOUNT

# Installing dependencies 
sudo apt install screen -y 
sudo apt install python3.10-venv 
sudo apt install git -y 

# Kill only the specific screen session if it exists
screen -X -S gaianet_script quit

python3 -m venv venv
source venv/bin/activate  
pip install cloudscraper

if [ ! -f "./account.txt" ]; then
  echo "Creating system file..."
  cat > "./account.txt" <<EOF
$API_KEY|https://$DOMAIN.gaia.domains/v1/chat/completions
EOF
fi

if [ ! -f "./message.txt" ]; then
  echo "Creating system file..."
  cat > "./message.txt" <<EOF
What is artificial intelligence?
How does machine learning work?
EOF
fi

if [ ! -f "./bot.py" ]; then
  echo "Creating system file..."
  cat > "./bot.py" <<EOF
import cloudscraper
import json
import random
import time
import threading
import sys

# Read thread count from command-line
try:
    num_threads = int(sys.argv[1])
    if num_threads < 1:
        print("Please enter a number greater than 0.")
        exit()
except (IndexError, ValueError):
    print("Invalid input. Please enter an integer.")
    exit()

# Read API Keys from account.txt
api_accounts = []
with open('account.txt', 'r') as file:
    for line in file:
        parts = line.strip().split('|')
        if len(parts) == 2:
            api_accounts.append((parts[0], parts[1]))

if not api_accounts:
    print("Error: No valid API keys found in account.txt!")
    exit()

# Read user messages from message.txt
with open('message.txt', 'r') as file:
    user_messages = [msg.strip() for msg in file.readlines() if msg.strip()]

if not user_messages:
    print("Error: No messages found in message.txt!")
    exit()

# Initialize Cloudscraper
scraper = cloudscraper.create_scraper()

# Function to send API request
def send_request(message):
    while True:
        api_key, api_url = random.choice(api_accounts)

        headers = {
            'Authorization': f'Bearer {api_key}',
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }

        data = {
            "messages": [
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": message}
            ]
        }

        try:
            response = scraper.post(api_url, headers=headers, json=data)

            if response.status_code == 200:
                try:
                    response_json = response.json()
                    print(f"✅ [SUCCESS] API: {api_url} | Message: '{message}'")
                    print(response_json)
                    break
                except json.JSONDecodeError:
                    print(f"⚠️ [ERROR] Invalid JSON response! API: {api_url}")
            else:
                print(f"⚠️ [ERROR] API: {api_url} | Status: {response.status_code} | Retrying in 2s...")
                time.sleep(2)

        except Exception as e:
            print(f"❌ [REQUEST FAILED] API: {api_url} | Error: {e} | Retrying in 5s...")
            time.sleep(5)

# Start multiple threads
def start_thread():
    while True:
        random_message = random.choice(user_messages)
        send_request(random_message)

threads = []
for _ in range(num_threads):
    thread = threading.Thread(target=start_thread, daemon=True)
    threads.append(thread)
    thread.start()

for thread in threads:
    thread.join()
EOF
fi

sleep 5 
chmod +x bot.py 
screen -dmS gaianet_script bash -c "source venv/bin/activate && python3 bot.py $THREADS_AMOUNT"
