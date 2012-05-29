# Maintainer: SJ_UnderWater based on
# Maintainer: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=alac
true && pkgname=(libalac alacconvert)
pkgver=3
pkgrel=1
pkgdesc="Apple Lossless Audio Codec library and codec"
arch=('i686' 'x86_64')
url="http://alac.macosforge.org/"
license=('APACHE')
makedepends=('subversion')

_svnmod=$pkgbase-$pkgver
_svntrunk="http://svn.macosforge.org/repository/$pkgbase/trunk"

build() {
	msg "Connecting to the SVN repository..."
	if [[ -d $_svnmod/.svn ]]; then
		 (cd $_svnmod && svn up -r $pkgver)
	else
		 svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
	msg "SVN checkout done or server timeout"
	cd $_svnmod
	msg2 "Fixing..."
	sed -i 's/LFLAGS) $(OBJS) -o alacconvert/OBJS) -o alacconvert $(LFLAGS)/' convert-utility/makefile
	sed -i 's/CFLAGS =/CFLAGS := $(CFLAGS)/' {codec,convert-utility}/makefile
	msg2 "Making..."
	CFLAGS=-Wno-multichar make -C convert-utility
}

package_alacconvert() {
	true && depends=(gcc-libs)
	cd $_svnmod/convert-utility
	install -D -m755 alacconvert "$pkgdir"/usr/bin/alacconvert
}
package_libalac() {
	true && license+=('CUSTOM')
	cd $_svnmod/codec
	install -D -m444 APPLE_LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -D -m444 libalac.a "$pkgdir"/usr/lib/libalac.a
}
