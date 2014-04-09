# Add buildroot to the path. Give it lowest priority, because it would 
# otherwise stomp all over ldd and some others.
_p='/opt/buildroot/bin'
[ -d "$_p" ] && PATH="$PATH:$_p"
export PATH
unset _p
