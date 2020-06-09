# source /usr/share/zsh-antigen/antigen.zsh
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen bundle chrissicool/zsh-256color

#antigen theme robbyrussell
antigen theme vincent

# Tell Antigen that you're done.
antigen apply


# PATH
export PATH="$HOME/.local/bin:$PATH"
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.local/bin

# -- Aliases ---------------------------------------
# commands
#alias vim='gvim -v'

# Aliases - shortcuts
alias dpp='cd ~/customers/dpp'
alias zoolite='cd ~/zoolite'
alias gi='~/.local/bin/grv'
alias ls='ls -l --group-directories-first --color'
alias aws-instances="aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | .Tags[]|select(.Key=="Name")|.Value'"
alias mydots='/usr/bin/git --git-dir=$HOME/.mydots/ --work-tree=$HOME'

# -- ssh-agent ----------------------------------------------------------------
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# --  AWS ---------------------------------------------------------------------
# Update prompt with AWS Profile
#function aws_prof {
#  local profile="${AWS_PROFILE}"
#
#  if [[ -z "${profile}" ]]
#  then echo ""
#  else echo "%{$fg_bold[blue]%}aws:(%{$fg[yellow]%}${profile}%{$fg_bold[blue]%})%{$reset_color%} "
#  fi
#}
#PROMPT='$(aws_prof)'

# -- Fuzzy finder --------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

# -- Initialize starship prompt
eval "$(starship init zsh)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -- Env variables ------------------------------------------------------------
export "JQ_COLORS=1;31"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
