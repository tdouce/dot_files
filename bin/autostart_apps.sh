#!/bin/sh

# Works with iTerm
# Open a bunch of tabs with running processes

# http://superuser.com/questions/299482/how-do-i-set-up-an-applescript-to-open-a-new-iterm2-tab-and-change-the-directory
# http://superuser.com/questions/605390/open-multiple-tabs-in-iterm2-with-a-specific-directories?lq=1
function new_tab () {
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

function start_memories () {
  MEMORIES_DIR="~/code/memories/"
  new_tab $MEMORIES_DIR 'start_postgres && be rails s -p 3000'
  new_tab $MEMORIES_DIR 'be mailcatcher'
  new_tab $MEMORIES_DIR 'be rails c'
  new_tab $MEMORIES_DIR 'start_redis'
  new_tab $MEMORIES_DIR 'bundle exec sidekiq'
  new_tab $MEMORIES_DIR 'mvim README.md'
  new_tab $MEMORIES_DIR 'clear'
}
