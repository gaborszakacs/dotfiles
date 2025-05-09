# eval "$(hub alias -s)"

export EDITOR=nvim
bindkey -e

# https://github.com/fohte/rubocop-daemon
export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"

export PATH="$HOME/.bin:$PATH"

# GO
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# Flutter
export PATH="$PATH:$HOME/flutter/bin"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
# moved from rbenv to asdf
# eval "$(rbenv init - --no-rehash)"
# . $HOME/.asdf/asdf.sh
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# brew autocompletions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# React Native tutorial

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Flutter
export PATH=$HOME/src/flutter/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# eval "$(jira --completion-script-zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gaborszakacs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gaborszakacs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gaborszakacs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gaborszakacs/google-cloud-sdk/completion.zsh.inc'; fi
alias gt="fswatch --event=Updated -e \".*\" -i \"\\.go$\" . | xargs -n1 -I {} sh -c \"clear && printf '\e[3J';go test ./... | sed ''/ok/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''\""
alias gta="fswatch -e \".*\" -i \"\\.go$\" . | xargs -n1 -I {} sh -c \"clear && printf '\e[3J';go test ./... -tags=e2e -count=1 | sed ''/ok/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''\""
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias mdc="(cd ~/src/web-dev-env && make monolith-dev-console)"
alias mtc="(cd ~/src/web-dev-env && make monolith-test-console)"
alias mrc="(cd ~/src/web-dev-env && make monolith-rails-console)"


ctags_ruby() {
  ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp . $(bundle list --paths)
}

# Weird error message when starting vim
export LC_ALL=en_US.UTF-8

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
export ERL_AFLAGS="-kernel shell_history enabled"


# Workaround for slow input performance inside bitrise run process
export BITRISE_SECRET_FILTERING=false

# manual links
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"

# protobuf 3
export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/protobuf@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/protobuf@3/include"



# disable homebrew auto update for god's sake
export HOMEBREW_NO_AUTO_UPDATE=1
# Funcs
# setup tmux workspace with 1-2 splits
ws() {
  tmux split-window -h
  WIDTH=$(($(tmux display-message -p '#{pane_width}') * 2 / 3 * 2))
  tmux resize-pane -x $WIDTH
  tmux select-pane -L
  tmux split-window -v
  HEIGHT=$(($(tmux display-message -p '#{pane_height}') * 2 / 3 * 2))
  tmux resize-pane -y $HEIGHT
}

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
autoload -Uz compinit && compinit
prompt pure

export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/gaborszakacs/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
