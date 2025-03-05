#!/bin/bash


# Цветовые коды
NEON_RED='\033[38;5;196m'
NEON_BLUE='\033[38;5;45m'
RESET='\033[0m'

# Логотип
logo() {
    echo -e "
${NEON_RED}  ____   ${NEON_BLUE}____
${NEON_RED} |  _ \\  ${NEON_BLUE}|  _ \\
${NEON_RED} | | | | ${NEON_BLUE}| |_) |
${NEON_RED} | |_| | ${NEON_BLUE}|  __/
${NEON_RED} |____/  ${NEON_BLUE}|_|
${RESET}
"
}

# Вызов логотипа
logo
echo -e "${NEON_BLUE}https://t.me/DropPredator${RESET}"


read -p "Enter your domain name: " DOMAIN
read -p "Enter your api key: " API_KEY



cd gaianet_script_folder
#Installing dependencies 
sudo apt install screen -y 
sudo apt install python3.10-venv -y 
sudo apt install git -y 
pkill screen


python3 -m venv venv && source venv/bin/activate && 

pip3 install cloudscraper

if [ ! -f "./account.txt" ]; then
  echo "Creating system file..."
  cat > "./account.txt" <<EOF
$API_KEY|https://$DOMAIN.gaia.domains/v1/chat/completions
EOF
fi

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
What is the difference between AI and machine learning?
What is deep learning?
How do neural networks function?
What is natural language processing?
How does computer vision work?
What are some real-world applications of AI?
What is the Turing test?
Who is Alan Turing and why is he important?
What is the history of artificial intelligence?
How do self-driving cars work?
What are the ethical concerns of AI?
How does AI impact job markets?
What is the singularity in AI?
What are chatbots and how do they work?
What is reinforcement learning?
How does AI generate images and videos?
What are large language models?
How does AI detect fraud?
What is blockchain technology?
How does Bitcoin work?
What is Ethereum?
How do smart contracts work?
What is a decentralized application (dApp)?
What is a cryptocurrency wallet?
How does mining work in cryptocurrency?
What is proof of work?
What is proof of stake?
What is the difference between a coin and a token?
How does a blockchain ensure security?
What are NFTs?
How are NFTs created?
What are the use cases of blockchain beyond crypto?
What is DeFi (Decentralized Finance)?
What is a DAO (Decentralized Autonomous Organization)?
How does Web3 differ from Web2?
What is quantum computing?
How does a quantum computer work?
What are qubits?
What is superposition in quantum computing?
What is quantum entanglement?
How can quantum computing revolutionize cryptography?
What are the challenges of quantum computing?
Who are the leaders in quantum computing development?
What is cloud computing?
What are the benefits of cloud computing?
What is SaaS (Software as a Service)?
What is IaaS (Infrastructure as a Service)?
What is PaaS (Platform as a Service)?
What is serverless computing?
What is edge computing?
What is a data center?
What is the difference between public and private clouds?
How do cloud storage services work?
What are APIs and how are they used?
What is REST API?
What is GraphQL?
What is an SDK?
What is microservices architecture?
How does containerization work?
What is Docker?
What is Kubernetes?
How does virtualization work?
What is a hypervisor?
What is 5G technology?
How is 5G different from 4G?
What are the benefits of 5G?
How does 5G impact IoT?
What are the security concerns with 5G?
What is Wi-Fi 6?
How do fiber-optic networks work?
What is a VPN and how does it work?
What is cybersecurity?
What are common types of cyber threats?
What is phishing?
What is ransomware?
How does encryption work?
What is two-factor authentication (2FA)?
What is a firewall?
How do antivirus programs work?
What is ethical hacking?
What is penetration testing?
How do password managers work?
What is zero-trust security?
What is the dark web?
How do Tor networks work?
What is biometric security?
What is facial recognition technology?
What are the risks of facial recognition?
How does fingerprint authentication work?
What is iris scanning technology?
What is AI-based fraud detection?
What is social engineering in cybersecurity?
How do digital signatures work?
What is a CAPTCHA?
How does end-to-end encryption work?
What is homomorphic encryption?
What is an IP address?
What is IPv6 and why is it important?
What is the Internet of Things (IoT)?
How do smart homes work?
What are some IoT security concerns?
What is an industrial IoT?
What is edge AI?
What is embedded computing?
How do smartwatches work?
What is augmented reality (AR)?
What is virtual reality (VR)?
What is mixed reality (MR)?
How does AR differ from VR?
What is the metaverse?
Who are the key players in the metaverse?
What is a digital twin?
How does 3D printing work?
What is additive manufacturing?
How does LiDAR technology work?
What is computer-aided design (CAD)?
What is robotic process automation (RPA)?
How do drones work?
What are the applications of drones?
What are self-replicating robots?
What is exoskeleton technology?
What are humanoid robots?
What is swarm robotics?
How do space robots work?
What is the history of robotics?
What are neural implants?
What is brain-computer interface (BCI)?
What is synthetic biology?
What is gene editing technology?
What is CRISPR?
What are biochips?
What are AI-driven prosthetics?
How does nanotechnology work?
What is a quantum internet?
What is the future of AI-generated content?
What is a hologram?
What is photonic computing?
What is DNA computing?
What is neuromorphic computing?
How does AI power autonomous robots?
What is 6G technology?
What is drone swarm technology?
What is self-healing software?
What is self-healing concrete?
What is decentralized cloud computing?
What is confidential computing?
What are AI-powered personal assistants?
What is edge AI computing?
What is predictive analytics?
What is a digital wallet?
How do mobile payments work?
What is a central bank digital currency (CBDC)?
How does AI detect deepfakes?
What is AI-generated music?
What is an AI-powered chatbot?
What is an AI-powered recommendation system?
What is an AI-powered translation service?
What are the dangers of AI bias?
What is explainable AI?
How does AI improve healthcare?
What is AI-driven drug discovery?
What is the role of AI in education?
What is the future of AI in creative industries?
What is AI-driven video editing?
What is AI-powered image recognition?
What is real-time AI translation?
What is the role of AI in agriculture?
How does AI help in climate research?
What is AI-generated storytelling?
What is an AI-powered writing assistant?
How does AI impact journalism?
What are digital humans?
How do autonomous ships work?
What is the Hyperloop?
How do maglev trains work?
What is AI-powered code generation?
What is the future of smart cities?
What is AI-based medical diagnosis?
How does AI power gaming NPCs?
What is AI-generated synthetic data?
How does AI predict earthquakes?
What are digital twins in manufacturing?
What are AI-driven surveillance systems?
What is the impact of AI on the film industry?
What is an AI-powered legal assistant?
What is AI-driven customer service?
What is AI-powered facial animation?
How does AI power financial trading algorithms?
What is the impact of AI on the music industry?
How does AI generate 3D models?
What is an AI-powered social media algorithm?
What is AI-powered stock market prediction?
How does AI detect plagiarism?
What is AI-powered fraud detection?
How does AI create deepfake videos?
What is AI-driven autonomous farming?
How does AI optimize logistics and supply chains?
How does AI impact space exploration?
What is the capital of France?
How does photosynthesis work?
Can you explain the theory of relativity in simple terms?
What is your favorite book and why?
If you could travel anywhere in the world, where would you go?
What are the benefits of regular exercise?
Who invented the telephone?
How does quantum computing differ from classical computing?
Why is the sky blue?
What exactly is artificial intelligence?
What are the main causes of climate change?
What is the meaning of life?
How do you solve a Rubik’s cube?
Can you explain the process of human digestion?
How many continents are there on Earth?
What is the best way to learn a new language?
Can you tell me a funny joke?
What is the smallest prime number?
Which is the largest planet in our solar system?
How does a computer process information?
What is the history of the Internet?
Can you describe the water cycle?
What is blockchain technology and how is it used?
What is the fastest land animal?
How do magnets work?
Why is the Mona Lisa so famous?
Who wrote "Romeo and Juliet"?
How do airplanes manage to stay in the air?
What causes earthquakes?
How do vaccines help protect our bodies?
What is the difference between a comet and an asteroid?
Why is renewable energy important for the future?
Can you explain the concept of gravity?
What are some key ingredients in a healthy salad?
How do you make the perfect cup of coffee?
What is your favorite programming language and why?
What is machine learning in simple terms?
How does an ecosystem maintain balance?
What exactly are black holes?
Can you recommend a good movie for a rainy day?
What is the difference between a virus and bacteria?
How does meditation benefit mental health?
What role does art play in society?
How does a smartphone function?
What is the Pythagorean theorem?
Can you explain how the stock market works?
What are the main stages of human life?
How do you cook pasta to achieve the perfect al dente texture?
What is the significance of dreams?
What is your opinion on space exploration?
How do the seasons change throughout the year?
What is the history behind the Olympic Games?
Can you explain the concept of supply and demand?
How does evolution shape the diversity of life?
What is the formula to calculate the area of a circle?
What are the benefits of reading regularly?
How is blockchain technology transforming industries?
Can you suggest a good book for self-improvement?
What are the main differences between Eastern and Western philosophies?
Why is mental health as important as physical health?
How does social media influence modern society?
What are the major world religions?
What function does the heart serve in the human body?
How do plants grow from seeds?
What is the history behind the Eiffel Tower?
Can you explain the concept of time dilation?
What are the advantages of electric cars over traditional vehicles?
How does the immune system defend the body?
What role does music play in different cultures?
How do you solve a quadratic equation?
Why is education important for personal growth?
Can you explain the fundamentals of democracy?
What are the differences between classical and jazz music?
How do satellites maintain orbit around the Earth?
What is significant about the Renaissance period?
Can you explain what virtual reality is?
What are common causes of stress and how can they be managed?
How do you play a game of chess?
What is the history of the space race between nations?
What are the characteristics of a balanced, healthy diet?
Can you tell me a little about your creators?
How does the human brain process information?
What distinguishes a smartphone from a tablet?
What is the historical development of the automobile?
How are weather forecasts generated?
What benefits does yoga offer for physical and mental well-being?
What is natural selection and how does it work?
Can you explain the basics of coding to a beginner?
What is the difference between fiction and non-fiction?
How is the speed of light measured?
Why is biodiversity important to our planet?
Can you recount a famous historical event?
What are the main components that make up a computer?
How do you start a conversation with someone new?
What is the history of human civilization?
Can you explain the theory of evolution?
What are some effective strategies for time management?
How does the Internet connect people around the world?
What ethical concerns arise with the development of AI?
Can you describe what an algorithm is in simple terms?
How do AI chatbots learn from conversations?
What is transfer learning in AI?
How does AI-powered speech recognition work?
What are some common AI programming languages?
How does AI generate realistic human faces?
What is an adversarial attack on AI models?
How does AI help in medical image analysis?
What is a GAN (Generative Adversarial Network)?
How do recommendation systems work on platforms like Netflix?
How does AI detect fraudulent transactions?
What is federated learning?
How does reinforcement learning apply to gaming AI?
What are transformer models in AI?
What is the role of AI in space exploration?
How does AI analyze satellite imagery?
What are self-supervised learning models?
What are AI-powered humanoid robots?
How does AI handle unstructured data?
How does AI predict disease outbreaks?
How does AI analyze financial markets?
What is AI-generated fashion design?
How does AI automate music composition?
How does AI generate human-like speech?
What are AI-powered self-healing systems?
How does AI help in legal case analysis?
What are quantum gates?
How does a quantum processor work?
What are superconducting qubits?
What is quantum cryptography?
EOF
fi

screen -dmS gaianet_script bash -c "python3 bot.py"



echo "Script for $DOMAIN is created successfully"
echo " "
echo ""
echo "Subscribe for author of autoinstaller:"
echo -e "${NEON_BLUE}https://t.me/DropPredator${RESET}"
