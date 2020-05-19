# Tested for Ubuntu 18.04 with gpu - part 2 after reboot - sets up dependencies for tensorflow
# Run this after the part of 1 the script - tensorflow-setup-before-reboot.sh is run and reboot done
# First make sure the file cudnn-10.0-linux-x64-v7.5.0.56.tgz is present in the system at the place where this command is run

echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc
sudo ldconfig

# nvidia-smi command should display expected results at this point
tar -xf cudnn-10.0-linux-x64-v7.5.0.56.tgz
sudo cp -R cuda/include/* /usr/local/cuda-10.0/include
sudo cp -R cuda/lib64/* /usr/local/cuda-10.0/lib64

sudo apt-get -y install libcupti-dev
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

sudo apt-get -y install python3-numpy python3-dev python3-pip python3-wheel