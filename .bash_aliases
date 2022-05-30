sudo locale-gen es_PE.UTF-8
export LC_ALL=es_PE.UTF-8
export LANG=es_PE.UTF-8
export LANGUAGE=es_PE.UTF-8
YEAR=$(date +%Y)
MONTH=$(date +"%B" | tr A-Z a-z)

alias pull="git pull origin master"
alias push="git push origin master"
alias master="git checkout master"
alias lsbranch="git branch"

function commit() { git add . && git commit -am "$1"; }
function branch() { git checkout "$1"; }
function cbranch() { git checkout -b "$1"; }
function dbranch() { git branch -d "$1"; }

function gomail() { route=/workspace/mailings && cd $route && echo $route | xclip - i; }
function onmail() { route=/workspace/mailings/mailings/optical/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function inmail() { route=/workspace/mailings/mailings/ingenio/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function ulmail() { route=/workspace/mailings/mailings/ultra/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function pomail() { route=/workspace/mailings/mailings/porto/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function vamail() { route=/workspace/mailings/mailings/valtx/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function obmail() { route=/workspace/mailings/mailings/obi/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
#function wimail() { route=C:/xampp/htdocs/win/public/mailing/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }
function ismail() { route=/workspace/mailings/mailings/isam/$YEAR/$MONTH && cd $route && echo $route | xclip - i; }

function create() { mkdir -p "$1" && cd "$1" && touch "index.mjml" && code -r index.mjml  && echo $(pwd -W) | clip; }

function chtml() { mjml index.mjml -o index.html && mjml index.mjml -o index.txt; }
