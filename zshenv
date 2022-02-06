# Environment
export EDITOR=nvim
export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND='fd --type f --no-ignore-vcs'
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export MOZ_ENABLE_WAYLAND=1
export BEMENU_BACKEND=wayland
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# - default flags for less
export LESS=dMqifr

typeset -U PATH path
path=(
        $HOME/.deno/bin
        $HOME/go/bin
        /usr/local/go/bin
        $HOME/.cargo/bin
        $HOME/.local/bin
        $HOME/.fzf/bin
        $HOME/.npm-global/bin
        $HOME/.luarocks/bin
        $HOME/bin "$path[@]"
)
export PATH
