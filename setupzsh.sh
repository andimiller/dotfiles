#!/bin/bash
set -v
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
hg clone ssh://hg@bitbucket.org/sjl/hg-prompt ~/Downloads/hg-prompt/
echo "Add this to your .hgrc:
[extensions]
prompt = ~/Downloads/hg-prompt/prompt.py"
cp andimiller.zsh-theme ~/.oh-my-zsh/themes/
