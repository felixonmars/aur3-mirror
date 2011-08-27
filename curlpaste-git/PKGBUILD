# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=curlpaste-git
pkgver=20090801
pkgrel=1
pkgdesc="Utility to post text files to a number of pastebin sites using curl and Lua"
arch=('i686' 'x86_64')
url="http://github.com/Kiwi/curlpaste/tree/master"
license=('MIT')
depends=('curl' 'lua')
makedepends=('git')
provides=('curlpaste')

_gitroot="git://github.com/Kiwi/curlpaste.git"
_gitname="curlpaste"

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf ${srcdir}/${_gitname}-build
	git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
	cd ${srcdir}/${_gitname}-build
  
	install -D -m755 ${_gitname} ${pkgdir}/usr/bin/${_gitname} || return 1
        install -D -m644 ${_gitname}.conf ${pkgdir}/etc/${_gitname}.conf || return 1
} 


