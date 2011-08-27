# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vstruct-git
pkgver=20090729
pkgrel=1
pkgdesc="A Lua library for packing and unpacking binary data."
arch=('i686' 'x86_64')
url="http://www.funkyhorror.net/toxicfrog/projects/vstruct/"
license=('MIT')
depends=('lua')
makedepends=('git')
provides=('vstruct')

_gitroot="git://github.com/ToxicFrog/vstruct.git"
_gitname="vstruct"

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

	mkdir -p ${pkgdir}/usr/lib/lua/5.1/${_gitname}
	cp *.lua ${pkgdir}/usr/lib/lua/5.1/${_gitname}
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
} 
