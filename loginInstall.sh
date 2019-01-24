#!/bin/bash
#check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[96mThis script must be run as root\e[0m" 
   exit 1
fi 

echo -e "\e[96mUpdating machine.\n\e[0m"
sudo apt-get -y update

echo -e "\e[96mAttempting to install Dependencies.\n\e[0m"
which pip3 > /dev/null
if [[ "$?" == 0 ]]; then
    echo -e "\e[42mPip3 already installed. Moving on...\e[0m"
elif [[ "$?" == 1 ]]; then
    sudo apt-get install -y python3-pip
    echo -e "\e[42mPip3 installation done\e[0m"
else
    echo -e "\e[41m Pip3 installation Failed!\e[0m"
fi
echo ""
echo -e "\e[96mAttempting to install Python3.\n\e[0m"
which python3 > /dev/null
if [[ "$?" == 0 ]]; then
    echo -e "\e[42mPython3 already installed. Moving on...\e[0m"
elif [[ "$?" == 1 ]]; then
#		checkInternet()
    sudo apt-get install -y python3
    echo -e "\e[42mPython3 installation done\e[0m"
else
    echo -e "\e[41m Python3 installation Failed!\e[0m"
fi
echo ""
echo -e "\e[41m Installing selenium. \e[0m"
pip3 install selenium
echo ""
echo -e "\e[96mAttempting to download chrome driver.\n\e[0m"
chromePath="/usr/bin/chromedriver"
usrbin="/usr/bin/"
if [[ -f "$chromePath" ]]; then
    echo -e "\e[42mFirefox driver already present. Moving on...\e[0m"
else
    wget -c "https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz"
    tar -xvf geckodriver-v0.23.0-linux64.tar.gz
    sudo mv geckodriver $usrbin
fi
echo ""
echo ""
echo -e "\e[41m Running uohLogin script \e[0m"
sudo mkdir -p ~/uohLogin
cp uohLogin.py ~/uohLogin/
chmod +x ~/uohLogin/uohLogin.py
echo "alias nwlogin='~/uohLogin/uohLogin.py'" >> ~/.bashrc
echo ""
echo -e " Use \e[41mnwlogin\e[0m to run the script."
