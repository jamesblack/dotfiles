sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash

source ~/.nvm/nvm.sh

nvm install node
nvm alias default node
nvm use default

npm install -g kody
