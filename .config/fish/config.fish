# vars
set -g TERM 'xterm-256color'
set -g EDITOR 'nvim'
set -g XDG_CACHE_HOME "$HOME/.cache/"
set -g VISUAL 'nvim'
set -g RANGER_LOAD_DEFAULT_RC 'FALSE'
set -g DOTNET_ROOT $HOME/.dotnet

# paths
set -gx PATH $HOME/.nvm/ $PATH
set -gx PATH $HOME/.npm-global/bin $PATH
set -gx PATH $DOTNET_ROOT:$DOTNET_ROOT/tools $PATH
set -gx PATH $HOME/dot.org/scripts $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.local/share/gem/ruby/3.0.0/bin $PATH
set -gx PATH $HOME/.local/share/nvim/mason/bin $PATH
set -gx PATH $HOME/nodejs_globals/bin $PATH
set -gx PATH $HOME/Softwares/jdk-17/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx PATH /usr/local/texlive/2023/bin/x86_64-linux $PATH
set -gx CPLUS_INCLUDE_PATH /usr/include/c++/11 $CPLUS_INCLUDE_PATH
set -gx CPLUS_INCLUDE_PATH /usr/include/x86_64-linux-gnu/c++/11/32 $CPLUS_INCLUDE_PATH
set -gx CPLUS_INCLUDE_PATH /usr/include/x86_64-linux-gnu/c++/11 $CPLUS_INCLUDE_PATH
set -gx CPLUS_INCLUDE_PATH /usr/include/x86_64-linux-gnu/c++/11/x32 $CPLUS_INCLUDE_PATH

# second brain
set -gx SECOND_BRAIN "$HOME/org"
set -gx ZK_NOTEBOOK_DIR "$SECOND_BRAIN/zettlekastans"

# fzf
set -gx FZF_DEFAULT_OPTS '--height 60% --layout=reverse --border'
set -gx FZF_DEFAULT_COMMAND 'rg --type f --strip-cwd-prefix'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# abbreviation
abbr -a lsa 'ls -alh'
abbr -a emacs 'emacsclient'
abbr -a ff 'fastfetch'
abbr -a za 'zoxide add'
abbr -a zq 'zoxide query'
abbr -a zqi 'zoxide query -i'
abbr -a zr 'zoxide remove'
abbr -a gs 'git status'
abbr -a es 'exa --icons --git-ignore'
abbr -a est 'exa --icons --tree --git-ignore'
abbr -a clr 'clear'
abbr -a cls 'clear'
abbr -a ext 'exit'
abbr -a tdr 'tldr --color'
abbr -a vim 'nvim'
abbr -a tmx 'tmux'
abbr -a lzg 'lazygit'
abbr -a lzd 'lazydocker'
abbr -a ggpull 'git pull origin'
abbr -a ggpush 'git push origin'
abbr -a gcmsg 'git commit -S -m'
abbr -a gco 'git checkout'
abbr -a gd 'git diff'
abbr -a gcl 'git clone --recurse-submodules'
abbr -a ga 'git add'
abbr -a gaa 'git add --all'
abbr -a gb 'git branch'
abbr -a gba 'git branch --all'
abbr -a g 'git'
abbr -a gs 'git status'
abbr -a clone 'git clone'
abbr -a nixb 'sudo nixos-rebuild switch --flake'
abbr -a homeb 'home-manager switch --flake'
abbr -a rofi 'rofi -config ~/.config/rofi/config.rasi'

# alises
alias ff 'fastfetch'
alias gs 'git status'
alias clone 'git clone'
alias lsa 'ls -alh'
alias es 'exa --icons --git-ignore'
alias est 'exa --icons --tree --git-ignore'
alias clr 'clear'
alias cls 'clear'
alias ext 'exit'
alias tldr 'tldr --color'
alias vim 'nvim'
alias tmx 'tmux'
alias lzg 'lazygit'
alias lzd 'lazydocker'
alias ggpull 'git pull origin'
alias ggpush 'git push origin'
alias gcmsg 'git commit -S -m'
alias gco 'git checkout'
alias gd 'git diff'
alias gcl 'git clone --recurse-submodules'
alias rofi 'rofi -config ~/.config/rofi/config.rasi'
alias ga 'git add'
alias gaa 'git add --all'
alias gb 'git branch'
alias gba 'git branch --all'
alias g 'git'
alias gs 'git status'
alias fzf 'fzf --bind "enter:execute($EDITOR {} &> /dev/tty)"'
alias rgf "rg --files | fzf --bind 'enter:execute($EDITOR {} &> /dev/tty)'"
alias org "cd $HOME/org && rgf"

if status is-interactive
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

#starship rs
starship init fish | source

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
