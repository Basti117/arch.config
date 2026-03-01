THEME=$1

if [ -z "$THEME" ]; then
    echo "Usage: $0 <colorscheme_name>"
    exit 1
fi

for sock in "${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"/nvim.*; do
    if [ -S "$sock" ]; then
	    nvim --server "$sock" --remote-expr "nvim_command('colorscheme $THEME')"
    fi
done
