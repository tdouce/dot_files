export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Colors directories a color different than files - Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
# Keep the last 5000 bash commands
export HISTFILESIZE=5000
# SML/NJ
export PATH="$PATH:/usr/local/smlnj/bin"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export GOPATH=$HOME/go

# Bash completion for aws cli
complete -C aws_completer aws

# Append history to history file as you type in commands
# Allows accessing history from commands entered in all tabs
shopt -s histappend
export PROMPT_COMMAND='history -a'

# Set editor to mvim
export EDITOR='mvim'

# bash completion from: http://blog.kramerapps.com/post/40839091386/git-on-osx
# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# git prompt from: http://blog.kramerapps.com/post/40839091386/git-on-osx
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# "__git_ps1" adds the current branch to the default prompt in OS X. Made
# available by 'git-prompt.sh' (see previous)
PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$"

### Start - Chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
# auto-switch the current version of Ruby when you cd between your different projects,
source /usr/local/opt/chruby/share/chruby/auto.sh
### End - Chruby

### Start - Handy aliases
#Mac
alias show_dot_files='defaults write com.apple.finder AppleShowAllFiles -bool YES'
alias hide_dot_files='defaults write com.apple.finder AppleShowAllFiles -bool NO'

# Editor
alias vi='mvim'

# Rails
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bec='bundle exec cucumber'
alias rs='bundle exec rails s'

# Applications
alias start_mongo='mongod --config /usr/local/etc/mongod.conf'
alias start_redis='redis-server --port 6379'
alias start_workers='bundle exec rake resque:work QUEUE=*'
alias start_mysql='mysql.server start'
alias start_solr='bundle exec rake sunspot:solr:run'
alias start_postgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# Git
alias s='git status'
alias a='git add'
alias d='git diff'
alias dc='git diff --cached'
alias co='git checkout'
alias cm='git commit --verbose'
alias amend='git commit --amend --verbose'
alias cmwip='git commit -m "WIP"'
alias cmsq='git commit -m "SQUASH"'
alias lg='git lg'
alias lgp='git log -p'
alias rb='git rebase -i'
alias show_stash='git stash show -p stash@{0}'
alias update_submod='git submodule update --recursive'
alias init_submod='git submodule init'
alias stash='git stash'

# Emacs
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias evim='emacsclient -t'
alias evi='emacsclient -t'

# General Bash
alias grep='grep -nri --color -C2'

# fun
alias idk="printf \"¯\_(ツ)_/¯\" | pbcopy && echo \"¯\_(ツ)_/¯ copied to clipboard\""
### End - Handy aliases

# Start - Terminal Prompt
# Adds colors to iTerm
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# Prompt. Not sure what this does?
PS1_HOST="\[\e[1;31m\]\u@\h\[\e[0m\]:"
PS1_PROMPT="$ "
if [ -z "${SSH_TTY-}" ]; then
    PS1_HOST=''
fi

# Displays current git branch in terminal
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Displays pwd in terminal prompt
PS1="$FGRN$PS1_HOST\w $FYEL\$(parse_git_branch)$FRED$PS1_PROMPT$RS"
# End - Terminal Prompt

# Adds vim bindings to terminal
#set -o vi
#set -o emacs

# emac key bindings
#bind '"\el": forward-word'    # make cursor jump forward one word; control+arrow_right
#bind '"\ek":
