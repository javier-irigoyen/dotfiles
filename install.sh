#!/usr/bin/bash -i
set -ex

# install script for gitpod dotfiles support
# https://gitpod.notion.site/Dotfiles-in-Gitpod-workspaces-b46b8723e9fe4efdbede72daa311961f

date
echo "Starting Gitpod install.sh..."

if [[ -n "${GITPOD_DOTFILES_SKIP}" ]]; then
  echo "Exiting Gitpod install.sh early..."
  exit
fi

export LC_ALL=es_PE.UTF-8
export LANG=es_PE.UTF-8
export LANGUAGE=es_PE.UTF-8
YEAR=$(date +%Y)
MONTH=$(date +"%B" | tr A-Z a-z)

alias pull="git pull origin master"
alias push="git push origin master"
alias master="git checkout master"
alias lsbranch="git branch"

function create() { mkdir -p "$1" && cd "$1" && touch "index.mjml" && code $PWD && echo $(pwd -W) | clip; }
function commit() { git add . && git commit -am "$1"; }
function branch() { git checkout "$1"; }
function cbranch() { git checkout -b "$1"; }
function dbranch() { git branch -d "$1"; }
