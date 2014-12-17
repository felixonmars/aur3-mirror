# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: pootzko <pootzko@gmail.com>
# Contributor: Jinx <jinxware@gmail.com>
# Contributor: Timothée Ravier <tim@siosm.fr>
 
pkgname=hydra
pkgver=8.1
pkgrel=2
pkgdesc="A very fast network logon cracker which support many different services."
arch=('i686' 'x86_64')
url="http://www.thc.org/thc-hydra/"
license="GPL3"
depends=('postgresql-libs' 'subversion' 'libssh' 'libmariadbclient' 'libidn' 'libfbclient')
optdepends=('gtk2: for graphical front-end (xhydra)')
source=("http://www.thc.org/releases/${pkgname}-${pkgver}.tar.gz"
        "fix-locations.patch")
md5sums=('7a20011400c6282603d4b1ae461cabf2'
         'e2e5638a786edd4a3fe1ef98bf775d37')
 
build() {
	cd $srcdir/$pkgname-$pkgver
	patch -p1 < ../fix-locations.patch
	./configure
	make
}
 
package() {
	cd $srcdir/$pkgname-$pkgver
	# Needed or else make install will not
	# install sample default password files
	mkdir -p $pkgdir/usr/etc/
	make PREFIX=$pkgdir/usr install
	# Move things installed in the wrong places to the right places
	mkdir -p $pkgdir/usr/share $pkgdir/etc
	mv $pkgdir/usr/man/ $pkgdir/usr/share/
	mv $pkgdir/usr/etc/ $pkgdir/etc/hydra/
}
