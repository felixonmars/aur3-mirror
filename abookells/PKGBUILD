# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Fabio Zanini <fabio.zanini@fastmail.fm>

pkgname=abookells
pkgver=20110619
pkgrel=1
pkgdesc='abook clone with vcard and group patches'
arch=('i686' 'x86_64')
url='https://gitorious.org/abookells'
license=('GPL2')
depends=('readline')
provides=('abook')
conflicts=('abook' 'abook-vcard')
_gitroot='git://gitorious.org/abookells/abookells.git'
_gitname='abookells'
source=()

build() {
	cd ${srcdir}
	msg "Connecting to the GIT server...."

	if [ -d ${srcdir}/${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/${_gitname}

	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd ${srcdir}/${_gitname}
	make DESTDIR="${pkgdir}" install
}
