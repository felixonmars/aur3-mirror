#Install the new jailkit shells
post_install() {
	if ! grep -q /usr/sbin/jk_chrootsh /etc/shells ; then 
		echo "Appending /usr/sbin/jk_chroots to /etc/shells"
		echo /usr/sbin/jk_chrootsh >> /etc/shells
	fi
}

#Remove the old jailkit shells upon pacman -R
pre_remove() {
	if grep -q /usr/sbin/jk_chrootsh /etc/shells ; then
		echo "Removing /usr/sbin/jk_chroots from /etc/shells"
		FILE=$(mktemp)
		grep -v /usr/sbin/jk_chrootsh /etc/shells > ${FILE}
		install -m 644 -o 0 -g 0 ${FILE} /etc/shells
		rm ${FILE}
	fi
}

op=$1
shift
[ "$(type -t "$op")" = "function" ] && $op "$@"

