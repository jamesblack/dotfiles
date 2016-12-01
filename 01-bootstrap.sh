curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

source ~/.nvm/nvm.sh

nvm install node
nvm alias default node
nvm use default
