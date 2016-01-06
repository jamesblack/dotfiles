curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash

source ~/.nvm/nvm.sh

nvm install node
nvm alias default node
nvm use default

npm install -g kody

cd kody_env

kody

apm stars -u jamesblack -i
