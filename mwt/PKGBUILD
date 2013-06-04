# Maintainer: "Super" Nathan Weber <supernathansunshine@gmail.com>

pkgname=mwt
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="A utility to try and match a Shakespearean sonnet with random intergers, usefull for stress testing"
arch=(any)
url="http://github.com/super-nathan/monkeys-w-typwriters"
license=('MIT')
depends=()
provides=(mwt)
changelog=ChangeLog.mwt
source=(http://super-nathan.com/downloads/$pkgname.tar.gz)
md5sums=('e17d9278ddf3a8c79894f9261dcca70d')
package() {
	mkdir -p ${pkgdir}/usr/bin
    cp mwt/mwt ${pkgdir}/usr/bin/mwt
    mkdir -p ${pkgdir}/usr/share/man/man1
    cp mwt/mwt.1.gz ${pkgdir}/usr/share/man/man1/mwt.1.gz
}
