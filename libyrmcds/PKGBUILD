# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=libyrmcds
pkgver=1.0.0
pkgrel=1
pkgdesc='A memcached client library for C/C++'
arch=('i686' 'x86_64')
url="http://cybozu.github.io/libyrmcds/"
license=('BSD')
depends=('lz4')
makedepends=('subversion')
source=("https://github.com/cybozu/libyrmcds/archive/v${pkgver}.tar.gz")

prepare() {
	cd "${srcdir}/libyrmcds-${pkgver}"
	sed -i 's/lz4\///' *.c
}

build() {
	cd "${srcdir}/libyrmcds-${pkgver}"
	make lib
}

package() {
	cd "${srcdir}/libyrmcds-${pkgver}"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 libyrmcds.a "${pkgdir}/usr/lib/libyrmcds.a"
	install -Dm644 yrmcds.h "${pkgdir}/usr/include/yrmcds.h"
}

md5sums=('41aaf822ea3d8df634738cf9bd7704ff')
