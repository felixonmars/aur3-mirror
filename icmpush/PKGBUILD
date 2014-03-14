# Maintainer: grawity@gmail.com
pkgname=icmpush
pkgver=2.2
pkgrel=2
pkgdesc='ICMP packet builder'
arch=("i686" "x86_64")
url="http://packages.debian.org/src:icmpush"
license=("GPL2")
source=("http://ftp.de.debian.org/debian/pool/main/i/icmpush/icmpush_$pkgver.orig.tar.gz"
	"http://ftp.de.debian.org/debian/pool/main/i/icmpush/icmpush_2.2-6.diff.gz")
md5sums=('a9832e789be4138f04fca87cbe20d29f'
         'b744953a0b37f88d50a8d3e8b2ac783f')

build() {
	cd "$srcdir/$pkgname-$pkgver.orig"
	patch -p1 < "../icmpush_2.2-6.diff"
	make linuz
}
package() {
	cd "$srcdir/$pkgname-$pkgver.orig"
	install -d "$pkgdir/usr/bin"
	install icmpush "$pkgdir/usr/bin/icmpush"
	install -Dm644 icmpush.8 "$pkgdir/usr/share/man/man8/icmpush.8"
}
# vim: set ft=sh
