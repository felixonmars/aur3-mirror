# Maintainer: Ianis G. Vasilev <mail@ivasilev.net>

pkgname=dalg-git
pkgver=1.0
pkgrel=0
pkgdesc='A microbenchmarking tool'
arch=('i686' 'x86_64')
url='https://github.com/v--/dalg'
license=('Apache License, Version 2.0')
makedepends=('git' 'dub' 'ldc')
provides=('dalg')
conflicts=('dalg')
md5sums=('SKIP')
source='git://github.com/v--/dalg.git'

package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "dalg"
	dub build -b release
	cp "$srcdir/dalg/dalg" "$pkgdir/usr/bin/dalg"
}
