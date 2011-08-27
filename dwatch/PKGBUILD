# Maintainer: andreww <andreww@photism.org>
# Contributor: andreww <andreww@photism.org>

pkgname=dwatch
pkgrel=1
pkgver=0.1.1
pkgdesc="a program that watches over other programs and performs actions based on conditions specified in a configuration file."
depends=('glibc')
arch=(i686 x86_64)
url="http://siag.nu/dwatch/"
license=('gpl')
source=(
        "http://siag.nu/pub/dwatch/$pkgname-$pkgver.tar.gz"
)
install=dwatch.install
md5sums=('25c06240cb5ab8126badc8a78dcd2b79')

build() {
	cd $srcdir/$pkgname-$pkgver || exit 1
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/man/man1 $pkgdir/usr/share/dwatch/ || exit 1
	make PREFIX=/usr ETCDIR=/etc || exit 1
	make install PREFIX=$pkgdir/usr ETCDIR=/etc || exit 1
	mv $pkgdir/usr/man $pkgdir/usr/share/ || exit 1
	cp $srcdir/$pkgname-$pkgver/dwatch.conf $pkgdir/usr/share/dwatch/example.conf || exit 1
}
