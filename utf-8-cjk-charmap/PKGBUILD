# Maintainer: Tomokazu Takada <wacky.mk0 at gmail dot com>

pkgname=utf-8-cjk-charmap
pkgver=1.0
pkgrel=1
pkgdesc="Custom UTF-8 charmap"
url="https://www.gnu.org/software/libc/index.html"
install=utf-8-cjk-charmap.install
license=('GPL')
arch=('any')
source=("http://sourceware.org/git/?p=glibc.git;a=blob_plain;f=localedata/charmaps/UTF-8;hb=HEAD" cjk.patch)
md5sums=('0b6a9af579c94373756a2bb16b5e3742' 'd758827f99a8e57e823d7b45a5590797')

build() {
	cd ${srcdir}
	cp "UTF-8;hb=HEAD" UTF-8-CJK
	patch < cjk.patch
	gzip UTF-8-CJK
}

package() {
	cd ${srcdir}
	
	install -m 644 -D UTF-8-CJK.gz ${pkgdir}/usr/share/i18n/charmaps/UTF-8-CJK.gz
}
