# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="ys"
#ZSH_THEME="amuse"
ZSH_THEME="dracula"
#ZSH_THEME="agnoster"
#ZSH_THEME="jonathan"
#ZSH_THEME=powerlevel10k/powerlevel10k

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
DISABLE_AUTO_TITLE="true"

alias gone='git fetch -p && for branch in $(git branch -vv | grep ": gone]" | awk '"'"'{print $1}'"'"'); do git branch -D $branch; done'
alias ggg='gfa && ggu && git submodule update --init && gone && git fetch xxtechec -t'

# Mac terminal encode
#export LC_ALL="zh_TW.UTF-8"
#export LANG="zh_TW.UTF-8"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

export PATH="$PATH:$(go env GOPATH)/bin"

# 預設主要分支改成 develop
git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in develop main master; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo develop
}
