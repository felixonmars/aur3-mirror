# Add buildroot to the path. Give it lowest priority, because it would 
# otherwise stomp all over ldd and some others.
set _p '/opt/buildroot/bin'
[ -d ${_p} ] && setenv PATH ${PATH}:${_p}
unset _p
