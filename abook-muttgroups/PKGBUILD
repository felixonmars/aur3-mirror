# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Fabio Zanini <fabio.zanini@fastmail.fm>

pkgname=abook-muttgroups
pkgver=20120702
pkgrel=1
pkgdesc='abook clone with vcard, mutt groups, merge, delete duplicates, mouse and color support'
arch=('i686' 'x86_64')
url='https://gitorious.org/abook/abook'
license=('GPL2')
depends=('readline')
provides=('abook')
conflicts=('abook' 'abook-vcard')
_gitroot='git://gitorious.org/abook/abook.git'
_gitname='abook'
source=()

build() {
	cd ${srcdir}
	msg "Connecting to the GIT server...."

	if [ -d ${srcdir}/${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
	git clone -b master ${_gitroot}
	fi

	cd ${srcdir}/${_gitname}
	msg "GIT checkout done or server timeout"

	msg "Starting make..."
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd ${srcdir}/${_gitname}
	make DESTDIR="${pkgdir}" install
}
