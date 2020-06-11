# My stuff
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization_apt.sh | bash

# Install dependencies
sudo apt -y update
sudo apt -y install python3-pip htop unzip
sudo ln -s /usr/bin/python3 /usr/bin/python

# NVIDIA driver
sudo apt -y install ubuntu-drivers-common
sudo ubuntu-drivers autoinstall
sudo nvidia-smi -acp UNRESTRICTED

# Install CUDA
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install -y cuda-*-10-0

## Add path stuff
echo 'export PATH=$PATH:/usr/local/cuda-10.0/bin' >> ~/.bashrc
echo 'export CUDADIR=/usr/local/cuda-10.0' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.0/lib64' >> ~/.bashrc
source ~/.bashrc

# Additional fluff for me
sudo pip3 install gpustat ipython ipdb
