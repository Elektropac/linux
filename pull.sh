#!/bin/bash

cd ~

echo "#!/bin/bash" > pullgit.sh

echo "sudo rm -r linux" >> pullgit.sh

echo "git clone https://github.com/elektropac/linux" >> pullgit.sh
echo "sudo chmod 777 linux/*" >> pullgit.sh
echo "cd linux" >> pullgit.sh
echo "./start.sh" >> pullgit.sh

sudo chmod 777 pullgit.sh

./pullgit.sh

cd ~
#sudo rm -r linux
#git clone https://github.com/elektropac/linux
#sudo chmod 777 linux/*
#cd linux
#./start.sh
