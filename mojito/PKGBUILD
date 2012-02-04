# Maintainer: Tomas Sironi

pkgname=mojito
pkgver=0.21.1
pkgrel=1
pkgdesc="A social store, which will fetch and store data from the social web (twitter, flickr, myspace, facebook, etc.)"
arch=('i686')
url="http://moblin.org/projects/mojito"
license=('GPL')
depends=('gnome-keyring')
makedepends=('libtool')
provides=($pkgname)
conflicts=($pkgname)
source=("http://moblin.org/sites/all/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('6ea3dd5839a8f194683fc90383563f89')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure
	make || return 1
	make install --DESTDIR=$pkgdir || return 1
}
