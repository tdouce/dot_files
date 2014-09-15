export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

## Colors directories a color different than files
# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Keep the last 5000 bash commands
export HISTFILESIZE=5000

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

# Chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

# auto-switch the current version of Ruby when you cd between your different projects,
source /usr/local/opt/chruby/share/chruby/auto.sh

# Handy terminal shortcuts
alias vi='mvim'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bec='bundle exec cucumber'
alias rs='bundle exec rails s'
alias s='git status'
alias a='git add'
alias d='git diff'
alias dc='git diff --cached'
alias co='git checkout'
alias cm='git commit'
alias cmwip='git commit -m "WIP"'
alias lg='git log'
alias lgp='git log -p'

# remote_factory_girl/cardiomems
alias run_test_hal='be rails server --environment=test --pid=/Users/travisdouce/code/cardiomems_hf_bootstrap/hal/tmp/pids/hal-test.pid --port=4000'
alias to_card='cd ~/code/cardiomems_hf_bootstrap/'
alias start_postgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# Intersect
alias to_inter='cd ~/code/intersect/'
alias to_retailme='cd ~/code/retailme-mac/'
alias update_submod='git submodule init && git submodule update --recursive'
alias start_mongo='mongod --config /usr/local/etc/mongod.conf'
alias start_redis='redis-server --port 6379'
alias start_workers='bundle exec rake resque:work QUEUE=*'
alias start_mysql='mysql.server start'
alias start_solr='bundle exec rake sunspot:solr:run'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# ANSI Colors
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

# Prompt
PS1_HOST="\[\e[1;31m\]\u@\h\[\e[0m\]:"
PS1_PROMPT="$ "
if [ -z "${SSH_TTY-}" ]; then
    PS1_HOST=''
fi

# parse and colorize terminal prompt
PS1="$FGRN$PS1_HOST\w $FYEL\$(parse_git_branch)$FRED$PS1_PROMPT$RS"
export GOPATH=$HOME/go

set -o vi

# http://superuser.com/questions/299482/how-do-i-set-up-an-applescript-to-open-a-new-iterm2-tab-and-change-the-directory
# http://superuser.com/questions/605390/open-multiple-tabs-in-iterm2-with-a-specific-directories?lq=1
new_tab () {
/usr/bin/osascript <<-EOF
tell application "iTerm"
    make new terminal
    tell the current terminal
        activate current session
        launch session "Default Session"
        tell the last session
            write text "cd $1 && clear && pwd && $2"
        end tell
    end tell
end tell
EOF
}

start_intersect () {
  INTERSECT_DIR="~/code/intersect/"
  new_tab $INTERSECT_DIR 'start_mysql'
  new_tab $INTERSECT_DIR 'start_solr'
  new_tab $INTERSECT_DIR 'start_mongo'
  new_tab $INTERSECT_DIR 'start_workers'
  new_tab $INTERSECT_DIR 'start_redis'
  new_tab $INTERSECT_DIR 'be rails s'
  new_tab $INTERSECT_DIR 'be rails c'
  new_tab $INTERSECT_DIR 'clear'
  new_tab $INTERSECT_DIR 'mvim README.md'
  new_tab $INTERSECT_DIR 'to_retailme'
}
