# Maintainer: 4chan <4chan.org>
pkgname=lgmask
pkgver=0.4.3
pkgrel=1
pkgdesc="A Port of GMask to Linux, written in pure Xlib. Supports m+/-, fl, q0, xor, rgb, hflip, vflip, hglass, vglass, and win."
arch=(any)
url="http://sourceforge.net/projects/lgmask/"
license=('GPL')
depends=(libjpeg)
source=(http://downloads.sourceforge.net/project/lgmask/0.4.3/lgmask-0.4.3.tar.gz)
md5sums=('96cf2602c0da02e15036d1d4de9d8a3b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/bin
    install -Dm755 lgmask $pkgdir/usr/bin
}
