# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=libqmi
pkgver=1.0
pkgrel=1
pkgdesc="QMI modem protocol helper library."
url="http://cgit.freedesktop.org/libqmi"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=()
conflicts=('libqmi-git')
replaces=()
backup=()
source=('http://ftp.gnome.org/pub/GNOME/sources/libqmi/1.0/libqmi-1.0.tar.xz');
md5sums=('1e00d300616efc1bf8d3e8e541a69f73')

build() {
	cd "${srcdir}/libqmi-${pkgver}"
	#./autogen.sh --prefix=/usr
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' build-aux/qmi-codegen/*.py
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' build-aux/qmi-codegen/qmi-codegen
	./configure

	make all
}

package() {
  cd "${srcdir}/libqmi-${pkgver}"
  make DESTDIR="${pkgdir}" install

}
