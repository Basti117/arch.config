CURRENT_ID=${KITTY_WINDOW_ID:-0}
for socket in /tmp/kitty-commands*; do
    if [ -S "$socket" ]; then
        ids=$(kitty @ --to "unix:$socket" ls | jq -r --arg current_id "$CURRENT_ID" '
            .[] | .tabs[].windows[] 
            | select(.foreground_processes[0].cmdline[0] | test("sh|bash|zsh|fish")) 
            | select(.foreground_processes | length == 1)
	    | select(.id != $current_id)
            | .id' 2>/dev/null)

        for id in $ids; do
            echo "Clearing idle window $id on $socket"
            kitty @ --to "unix:$socket" send-text --match "id:$id" " clear\r"
        done
    fi
done
