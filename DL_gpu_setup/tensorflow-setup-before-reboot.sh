# Tested for Ubuntu 18.04 with gpu - part 1 before reboot - sets up dependencies for tensorflow
# Verify You Have a CUDA-Capable GPU - lspci | grep -i nvidia
# Verify You Have a Supported Version of Linux -  uname -m && cat /etc/*release - x86_64 line indicates you are running on a 64-bit system which is supported by cuda 10.0.

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y purge nvidia*
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo rm -rf /usr/local/cuda*
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-get -y update
sudo apt-get -y -o Dpkg::Options::="--force-overwrite" install cuda-10-0 cuda-drivers
sudo reboot

#After reboot run the part 2 of the script - tensorflow-setup-after-reboot.sh
