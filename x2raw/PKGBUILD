# Maintainer: Maskawanian <aur@cryingwolf.org>
pkgname=x2raw
pkgver=2009.10.21
pkgrel=1
pkgdesc="Script to convert any mplayer supported audio file to RAW suitable for Asterisk IVRs."
arch=(any)
depends=('mplayer' 'sox')
license=('custom:MIT')
url=('http://www.slello.com')
source=(x2raw)
md5sums=(61fb0445348bd26c2e545d08db551b74)

build() {
	mkdir -p ${pkgdir}/usr/bin || return 1
	cp ${srcdir}/x2raw ${pkgdir}/usr/bin
	chmod a+x  ${pkgdir}/usr/bin/x2raw
	chmod a+r  ${pkgdir}/usr/bin/x2raw
}

