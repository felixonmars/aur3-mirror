# Maintainer: brainpower aka. oi_wtf <brainpower at gulli dot com>

pkgname=libaccounts-qt
_dl_pkgname=accounts-qt
pkgver=1.2
pkgrel=1
pkgdesc="QT library for single sign on"
arch=('i686' 'x86_64')
url="http://accounts-sso.googlecode.com"
license=('LGPL')
depends=('qt' 'libaccounts-glib')
makedepends=('doxygen' 'pkg-config')
groups=("unity-webapps")

source=("http://accounts-sso.googlecode.com/files/${_dl_pkgname}-${pkgver}.tar.bz2")
md5sums=('d390fb8bcfd7bfe54d4262c5ab8b0d03')

build(){
	cd "${srcdir}/${_dl_pkgname}-${pkgver}"

	# configure
	qmake ${_dl_pkgname}.pro

	# make
	make ${MAKEFLAGS}
}

package(){
	cd "${srcdir}/${_dl_pkgname}-${pkgver}"

	make install INSTALL_ROOT="${pkgdir}"

	rm -fr "${pkgdir}"/usr/share/libaccounts-qt-tests/
	rm -fr "${pkgdir}"/usr/bin/
}
