# ~/.bash_logout: executed by bash(1) when login shell exits.

# turn off when logout. SAVE MONEY!
echo " *-- halt REMOTE INSTANCE?...[y/N]"
read user_input

if [[ ! ${user_input} =~ ^[Yy]$ ]]
then
    echo "SEE YA!"
else
    echo "POWER OFF"
    sudo halt -p
fi

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
