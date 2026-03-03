for socket in /tmp/kitty-commands*; do
    if [ -S "$socket" ]; then
        # Korrigierter jq-Pfad: .[].tabs[].windows[]
        # Wir greifen auf das erste Element des Arrays foreground_processes zu: .[0]
        ids=$(kitty @ --to "unix:$socket" ls | jq -r '
            .[] | .tabs[].windows[] 

            | select(.foreground_processes[0].cmdline[0] | test("sh|bash|zsh|fish")) 
            | select(.foreground_processes | length == 1) 
            | .id' 2>/dev/null)

        for id in $ids; do
            echo "Clearing idle window $id on $socket"
            kitty @ --to "unix:$socket" send-text --match "id:$id" 'clear\r'
        done
    fi
done
