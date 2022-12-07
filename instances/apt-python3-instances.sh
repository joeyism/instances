#!/bin/bash
sudo apt install -y python3-pip
pip3 install --user numpy ipython ipdb virtualenv
curl https://raw.githubusercontent.com/joeyism/instances/master/customization-scripts/base_customization_apt.sh | bash
