
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
#
# Your previous /Users/fahlberg/.bash_profile file was backed up as /Users/fahlberg/.bash_profile.macports-saved_2014-10-13_at_19:35:29
##

# MacPorts Installer addition on 2014-10-13_at_19:35:29: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

export PS1="\W $ "
