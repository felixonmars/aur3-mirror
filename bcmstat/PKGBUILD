# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=bcmstat
pkgver=0.2.1
pkgrel=1
pkgdesc='Simple Raspberry Pi monitoring tool.'
arch=('any')
url='https://github.com/MilhouseVH/bcmstat'
license=('GPL')
depends=('python2')
makedepends=('git')
source=("git+${url}.git#commit=efe84b14197ac3fd4938572c0e64fd37096bacb5")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname}"
	sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' bcmstat.sh
}

package() {
	cd "$srcdir/${pkgname}"
	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	install -m644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGELOG.md README.md VERSION
	install -Dm755 'bcmstat.sh' "$pkgdir/usr/bin/bcmstat.sh"
	ln -s bcmstat.sh "$pkgdir/usr/bin/bcmstat"
}
