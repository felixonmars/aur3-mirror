# -*- shell-script -*-
# Maintainer: goodmen <goodmenzy@gmail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=crosstool-ng-hg
pkgver=3243.9838aecd6340
pkgrel=1
pkgdesc="crosstool-NG aims at building toolchains."
arch=('i686' 'x86_64')
url="http://crosstool-ng.org/"
license=('GPL')
depends=('bash>=3.0' 'make>=3.80' 'ncurses' 'gperf')
makedepends=('mercurial')
conflicts=('crosstool-ng')
source=('hg+http://crosstool-ng.org/hg/crosstool-ng')
md5sums=('SKIP')

pkgver() {
	cd crosstool-ng

	printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build () {
	cd crosstool-ng

	./bootstrap
	./configure --prefix=/usr
	make
}

package () {
	cd crosstool-ng

	make DESTDIR="$pkgdir" install
	install -Dm644 ct-ng.comp "$pkgdir/etc/bash_completion.d/ct-ng"
}
