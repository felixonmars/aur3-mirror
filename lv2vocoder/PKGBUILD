# Maintainer: rtfreedman (rob{d0t}til{d0t}freedman{aT}googlemail{d0t}com)
# Contributor: Nate Slottow (m00tp01nt) <nslottow AT gmail DOT com>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# http://www.sirlab.de/linux/descr_vocoder.html
pkgname=lv2vocoder
pkgver=1
pkgrel=5
pkgdesc="LV2 Vocoder Plugin"
arch=('i686' 'x86_64')
## url currently unmaintaned
url="http://home.gna.org/lv2vocoder/"
license=('GPL')
depends=('glibc')
makedepends=('lv2core')
## 0001-fix_symbols.patch comes from http://ftp.debian.org/debian/pool/main/l/lv2vocoder/lv2vocoder_1-3.debian.tar.gz
source=('http://ftp.debian.org/debian/pool/main/l/lv2vocoder/lv2vocoder_1.orig.tar.bz2'
		'0001-fix_symbols.patch' 
		'cc_verbose.patch')

md5sums=('8c0096978e9c58a252f247e1f7f7ed63'
         '527db09895546cf7082b919709fd8752'
         'db19786f55224e1f0d222c1855e6d3ae')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i ../0001-fix_symbols.patch
	patch -p1 -i ../cc_verbose.patch
}

build() {
	cd "$pkgname-$pkgver"
	make vocoder.so
}


package() {
	cd "$pkgname-$pkgver"
	## install plugin
	install -dm755 "${pkgdir}"/usr/lib/lv2/$pkgname.lv2
	install -m755 -t "${pkgdir}"/usr/lib/lv2/$pkgname.lv2 vocoder.so
	install -m644 -t "${pkgdir}"/usr/lib/lv2/$pkgname.lv2 manifest.ttl vocoder.ttl
	## install doc - add what u like
	install -dm755 "${pkgdir}"/usr/share/doc/$pkgname
	install -m644 -t "${pkgdir}"/usr/share/doc/$pkgname README # lv2vocoder-ingen.png lv2vocoder-patchage.png 
}
