# ~/.profile
# Executed by the command interpreter for login shells.
# Not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# The default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# If running bash...
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists.
    [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# Set PATH so it includes other directories if present.
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "/opt/bin" ]  && PATH="/opt/bin:$PATH"
