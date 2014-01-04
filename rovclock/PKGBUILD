# $Id: PKGBUILD,v 1.4 2006/08/02 13:44:35 pix Exp $
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=rovclock
pkgver=0.6e
pkgrel=1
pkgdesc="A tool to set the clock rate of Radeon graphics cards"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.hasw.net/linux"
source=("http://www.hasw.net/linux/$pkgname-$pkgver.tar.bz2" rovclock.conf rovclock.init)
install=rovclock.install
md5sums=('bebd45ee75fd95c5e52bdad17076988d' 'a09ed664e89393b1524b31035b9fa11f' 'ac392bc5286fe25944f223ba18c4ed42')
depends=('bash')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m755 rovclock "$pkgdir/usr/bin/rovclock"
	install -D -m755 "$srcdir/rovclock.conf" "$pkgdir/etc/conf.d/rovclock"
	# needs a unit
	install -D -m755 "$srcdir/rovclock.init" "$pkgdir/etc/rc.d/rovclock"
}
