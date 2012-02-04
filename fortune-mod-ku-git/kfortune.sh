kfortune_conf()
{
  if [ -w /proc/kfortune ]
  then
    printf "ka\n" > /proc/kfortune
    cat /usr/share/fortune/abc > /dev/ka
  fi
}
add_hook multi_end kfortune_conf
