# Contributor: Jan Lieven jan [at] das [minus] labor [dot] org
# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=volatility-linux-svn
pkgver=866
pkgrel=1
pkgdesc="An advanced memory forensics framework [linux-support svn branch]"
arch=('any')
url="http://code.google.com/p/volatility/"
license=('GPL2')
depends=('python2')
makedepends=('subversion')
options=('!emptydirs')
_svnmod="volatility-linux"
_svntrunk="http://volatility.googlecode.com/svn/branches/linux-support/"
provides=('volatility-linux')

build() {
	# fetch latest svn build
	if [ -d ${srcdir}/.svn ]; then
	  msg 'Updating volatility [linux-support branch] svn...'
	  svn up ${srcdir} || return 1
	else
	  msg 'Checking out volatility [linux-support branch] SVN...'
	  svn co ${_svntrunk} ${srcdir} || return 1
	fi
	msg "volatility [linux-support branch] checkout complete, or the server timed out"

	mkdir -p ${pkgdir}/usr/{bin,src} || return 1
	cd ${srcdir}
	svn export ${srcdir} ${pkgdir}/usr/src/${_svnmod} || return 1

	# archlinux fixes
	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
	    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
	    $(find ${pkgdir}/usr/src/${_svnmod} -name '*.py') || return 1
	grep -rl vol.py ${pkgdir}/usr/src/${_svnmod} | xargs sed -i 's|vol.py|volatility.py|g' || return 1

	# create startup app
	echo "#!/bin/sh" > ${pkgdir}/usr/bin/vollinux || return 1
	echo "cd /usr/src/volatility-linux" >> ${pkgdir}/usr/bin/vollinux || return 1
	echo "python2 ./volatility.py \"\$@\"" >> ${pkgdir}/usr/bin/vollinux || return 1
	echo "cd -" >> ${pkgdir}/usr/bin/vollinux || return 1
	chmod +x ${pkgdir}/usr/bin/vollinux || return 1

	# user notification
	echo -e ""
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/vollinux -h\e[0m\e[1;31m' for an explanation of Volatility [linux-support branch] startup options\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mVolatility project homepage @ \e[0m\e[1;32mhttps://www.volatilesystems.com/default/volatility\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mVolatility framework goolgecode @ \e[0m\e[1;32mhttp://code.google.com/p/volatility/\e[0m"
	echo -e ""
}
# vim:syntax=sh
