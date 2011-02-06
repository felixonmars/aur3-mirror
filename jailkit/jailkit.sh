# arg 1:  the new package version
post_install() {
  if ! grep -q /usr/sbin/jk_chrootsh /etc/shells ; then \
                echo "Appending /usr/sbin/jk_chroots to /etc/shells";\
                echo /usr/sbin/jk_chrootsh >> /etc/shells ;\
        fi
}

# arg 1:  the old package version
pre_remove() {
  if grep -q /usr/sbin/jk_chrootsh /etc/shells ; then \
                echo "Removing /usr/sbin/jk_chroots from /etc/shells";\
                fil=`mktemp`
                grep -v /usr/sbin/jk_chrootsh /etc/shells >${fil}
                install -m 644 -o 0 -g 0 ${fil} /etc/shells
                rm ${fil}
        fi
}

op=$1
shift
[ "$(type -t "$op")" = "function" ] && $op "$@"

