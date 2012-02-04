# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ompluad-git
pkgver=20090904
pkgrel=1
pkgdesc="Script to upload files to omploader.org"

arch=('i686' 'x86_64')
url="http://github.com/Kiwi/ompluad/tree/master"
license=('MIT')
depends=('luasocket')
makedepends=('git')
provides=('ompluad')
source=('COPYING')
md5sums=('cc3dcddba8b29b3ecedd5ac09d7d35e8')

_gitroot="git://github.com/Kiwi/ompluad.git"
_gitname="ompluad"

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
	install -D -m644 ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}



