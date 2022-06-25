# eval "$(hub alias -s)"
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
autoload -Uz compinit && compinit
prompt pure

export EDITOR=vim
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
. $HOME/.asdf/asdf.sh

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

