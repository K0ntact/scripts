#!/bin/bash

URL="https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz"
wget $URL

FILENAME=$(basename $URL)
sudo tar -xzvf $FILENAME -C /usr/local/bin
rm $FILENAME
