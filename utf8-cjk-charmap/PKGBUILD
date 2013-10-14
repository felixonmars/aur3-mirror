# Maintainer: Tomokazu Takada <wacky.mk0 at gmail dot com>

pkgname=utf8-cjk-charmap
pkgver=1.0
pkgrel=1
pkgdesc="Custom UTF-8 charmap"
url="https://www.gnu.org/software/libc/index.html"
install=utf8-cjk-charmap.install
license=('GPL')
arch=('any')
source=(cjk.patch)
md5sums=('d758827f99a8e57e823d7b45a5590797')

build() {
	cd ${srcdir}
	zcat /usr/share/i18n/charmaps/UTF-8.gz > UTF-8-CJK
	patch < cjk.patch
	gzip UTF-8-CJK
}

package() {
	cd ${srcdir}
	
	install -m 644 -D UTF-8-CJK.gz ${pkgdir}/usr/share/i18n/charmaps/UTF-8-CJK.gz
}
