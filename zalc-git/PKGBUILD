# Maintainer : ziggi <xziggix@gmail.com>
pkgname='zalc-git'
pkgver=20130612
pkgrel=2
pkgdesc='A small, FLTK-based calculator'
arch=('i686' 'x86_64')
url='http://ziggi.org/category/developments/zalc/'
license=('GPLv3')
depends=('fltk')
provides=('zalc')

_gitroot='https://github.com/ziggi/zalc.git'
_gitname='zalc'

build () {
	cd "${srcdir}"
	if [ -d "${_gitname}" ] ; then
		msg "The files are updated"
	else
		git clone "${_gitroot}"
	fi
	cd "${_gitname}"
	./configure
	make
}
package() {
	cd "${srcdir}/${_gitname}/src/"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	cp zalc "${pkgdir}/usr/bin/"
	cd "${srcdir}/${_gitname}/"
	cp zalc.desktop "${pkgdir}/usr/share/applications/"
	cp zalc.png "${pkgdir}/usr/share/pixmaps/"
	
	chmod 0755 "${pkgdir}/usr/bin"
	chmod 0755 "${pkgdir}/usr/bin/zalc"
}
