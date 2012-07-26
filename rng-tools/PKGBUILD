# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=rng-tools
pkgver=3
pkgrel=3
pkgdesc="Feeds random data from another device to the kernel random device"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gkernel/"
license=('GPL')
backup=(etc/conf.d/rngd)
source=(http://downloads.sourceforge.net/sourceforge/gkernel/$pkgname-$pkgver.tar.gz
        rngd
        rngd.conf)
md5sums=('fa305916ec101c85c0065aeceb81a38d'
        'bb348fbe778e5ced48e52989aec5c38a'
        '65b1e4619584c79fe01d30f0fc63e6a3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm0755 "$srcdir/rngd" "$pkgdir/etc/rc.d/rngd"
	install -Dm0644 "$srcdir/rngd.conf" "$pkgdir/etc/conf.d/rngd"
}
