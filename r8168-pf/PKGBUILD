# $Id: PKGBUILD 72484 2012-06-15 13:23:57Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >

_pkgname=r8168
pkgname=r8168-pf
pkgver=8.031.00
pkgrel=2
pkgdesc="A kernel module for Realtek 8168 network cards (pf kernel)"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux-pf>=3.4' 'linux-pf<3.5')
makedepends=('linux-pf-headers')
source=(http://r8168.googlecode.com/files/$_pkgname-$pkgver.tar.bz2)
install=$_pkgname.install

_extramodules=extramodules-3.4-pf
_kernver="$(cat /lib/modules/$_extramodules/version || true)"

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make clean SYSSRC=/usr/src/linux-$_kernver modules
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/src"
	install -D -m644 $_pkgname.ko "$pkgdir/lib/modules/$_extramodules/$_pkgname.ko"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}

md5sums=('ec1654f02e2dad930bbeb0210ddab7e5')
sha256sums=('5c617b3c08aca18d1eb24d33f77df40020eb64fb32c8e4008265e08b7ffe5779')
