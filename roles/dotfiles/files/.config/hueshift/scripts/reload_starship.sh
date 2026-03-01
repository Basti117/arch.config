for socket in /tmp/kitty-commands*; do
    if [ -S "$socket" ]; then
	echo "Sending stuff to $socket"
        kitty @ --to "unix:$socket" send-text --match 'all' 'clear\r'
    fi
done
