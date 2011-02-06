#
# Author: Larhard Haranel <larhard@gmail.com>
# Maintainer: Artur Wrona <xart14@gmail.com>
#

pkgname=adresownik
pkgver=1.0.2
pkgrel=1
pkgdesc="Console email address book"
arch=('i686' 'x86_64')
url="http://elgassia.cba.pl/?s=linux&c=progr"
license=('GPL')
groups=()
depends=()
optdepends=()
provides=('adresownik')
source=("http://elgassia.cba.pl/files/adresownik/${pkgname}-${pkgver}.tar.gz")
md5sums=('1237b9a36eef0070603942e1fe490b02')

build () {
	cd $srcdir
	make
}

package () {
	cd $srcdir
	make DESTDIR=$pkgdir install
}
