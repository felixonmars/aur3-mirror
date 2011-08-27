# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>
# $Id: PKGBUILD,v 1.11 2010/12/17 22:23:00 andres Exp $

pkgname="cvs-feature"
pkgver=1.12.13
pkgrel=5
pkgdesc="CVS with additional improvements, like proxy support and new options"
arch=('i686' 'x86_64')
url="http://cvs.nongnu.org"
license=('GPL' 'LGPL')
depends=('heimdal')
optdepends=('openssh: for using cvs over ssh' 'inetutils: for using cvs over rsh')
provides=('cvs')
conflicts=('cvs')
install="cvs.install"
source=("ftp://ftp.gnu.org/non-gnu/cvs/source/feature/$pkgver/cvs-$pkgver.tar.bz2")
md5sums=('956ab476ce276c2d19d583e227dbdbea')

build() {
	cd cvs-"$pkgver"

	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		#

	make
}

package() {
	cd cvs-"$pkgver"

	make install DESTDIR="$pkgdir"
}
