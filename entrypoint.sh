#!/bin/bash

# All run as user docs
touch /home/docs/.bashrc
echo "export GEM_HOME=${HOME}/.gem" >> /home/docs/.bashrc
echo "export GEM_PATH=${HOME}/.gem" >> /home/docs/.bashrc
echo "export PATH=${PATH}:/srv/node_modules/.bin" >> /home/docs/.bashrc
. /home/docs/.bashrc
bundle config set --local path "$HOME"/.gem
bundle install
npm install @mermaid-js/mermaid-cli
exec /bin/bash
