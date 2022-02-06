#!/usr/bin/env bash

# Install complementary software beyond a base Arch install.

sudo pacman -S \
        git-delta \
        ripgrep \
        fd \
        fzf \
        npm \
        neovim \
        go \
        rust \
        shfmt \
        ;

# Language servers
if [[ ! -d ~/.npm-global ]]; then
        mkdir ~/.npm-global
fi
npm config set prefix ~/.npm-global
npm install --global \
        bash-language-server \
        graphql-language-server \
        vscode-langservers-extracted \
        typescript-language-server \
        typescript \
        yaml-language-server \
        ;
