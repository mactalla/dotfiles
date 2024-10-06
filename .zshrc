[[ -e ~/.zshrc.local ]] && source ~/.zshrc.local

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"

DEFAULT_USER=`whoami`

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( colored-man-pages command-not-found git sudo dotenv docker )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export VISUAL='/usr/bin/vim'
export EDITOR='/usr/bin/vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)

if type lsb_release > /dev/null && [[ $(lsb_release -i) =~ "Ubuntu" ]]; then
    POWERLEVEL9K_OS_ICON_FOREGROUND=202
fi

POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='deepskyblue4'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='deepskyblue4'
#POWERLEVEL9K_VCS_GIT_HOOKS="(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)"
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-remotebranch git-tagname)
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="↑"
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="↓"
POWERLEVEL9K_VCS_UNSTAGED_ICON="●"

source $ZSH/oh-my-zsh.sh

[[ -e /usr/share/powerlevel9k/powerlevel9k.zsh-theme ]] && source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
[[ -e /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme ]] && source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
[[ -e /opt/homebrew/opt/powerlevel9k/powerlevel9k.zsh-theme ]] && source /opt/homebrew/opt/powerlevel9k/powerlevel9k.zsh-theme

[[ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -e /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function asan() {
    $@ 2>&1 | asan_symbolize-6.0 -d
}
function asan38() {
    $@ 2>&1 | asan_symbolize-3.8 -d
}

#export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
export CTEST_OUTPUT_ON_FAILURE=true
export CMAKE_GENERATOR=Ninja
[[ -d /Applications ]] && export CMAKE_GENERATOR=Xcode

alias please='sudo $(fc -ln -1)'

# Disable Git info on mounted drives.
zstyle ':vcs_info:*' disable-patterns "$HOME/windows-dev(|/*)"


#eval "$(chef shell-init zsh)"
#export BERKSHELF_CHEF_CONFIG=~/src/chef/chef-repo/.chef/knife.rb
#export BERKSHELF_PATH=/opt/tera-chef
#export CHEF_VERSION='14'
export CHEF_VERSION='14.12.9'
#export AWS_DEFAULT_PROFILE='dev-engineer'
#export AWS_PROFILE='dev-engineer'
#export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
export VAGRANT_VMWARE_CLONE_DIRECTORY="$HOME/.vagrant.d/clones"

function workon() {
    export DEST_MACHINE=$@
}

# Override some highlight colours
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'

export LS_COLORS='di=1;31'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

export TSAN_OPTIONS=halt_on_error=1
export ASAN_SYMBOLIZER_PATH=/usr/lib/llvm-6.0/bin/llvm-symbolizer
export IWYU_BINARY=~/src/include-what-you-use/build/bin/include-what-you-use
#export ARTIFACTORY_CACHE=${HOME}/src/artifactory-cache

function drun() {
    cmd="${@:3}"
    docker run --rm -it -v ${HOME}/.ccache:/root/.ccache -v ${HOME}/src/${1}:${HOME}/src/${1} -w ${HOME}/src/${1}/build/${2} ${1}-${2} bash -c "${cmd}"
}

[[ $SSH_AGENT_PID ]] || eval `ssh-agent`



alias mcd_log="AWS_PROFILE=dev-engineer aws logs tail --follow /ecs/mcd/app"
alias mcd_log_prod="AWS_PROFILE=prod-engineer aws logs tail --follow /ecs/mcd/app"

alias mcd_api_log="AWS_PROFILE=dev-engineer aws logs tail --follow /ecs/mcdapi/app"
alias mcd_api_log_prod="AWS_PROFILE=prod-engineer aws logs tail --follow /ecs/mcdapi/app"

[[ -e "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

[[ -e "$HOME/.local/bin" ]] && export PATH="$PATH:$HOME/.local/bin"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export NOOM_PYPI_URL=$(AWS_PROFILE=dev-engineer aws ssm get-parameter --name /pypi/PYPI_SHARED_READONLY_URL --with-decryption --output text --query Parameter.Value)
export PIP_INDEX_URL="$NOOM_PYPI_URL"

prunebranches() {
REBASE_TARGET=origin/HEAD
for branch in $(git for-each-ref --format="%(refname:lstrip=2)" refs/heads/); do
    git rebase "$REBASE_TARGET" "$branch" || git rebase --abort
done
}


[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# To explore:
# autojump
# fzf

