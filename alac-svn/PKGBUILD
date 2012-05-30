# Maintainer: SJ_UnderWater based on
# Maintainer: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=alac-svn
pkgver=3
pkgrel=2
pkgdesc="Apple Lossless Audio Codec library and codec"
arch=('i686' 'x86_64')
url="http://alac.macosforge.org/"
license=('APACHE' 'CUSTOM')
depends=(gcc-libs)
provides=(alac alacconvert libalac)
conflicts=(${provides[@]})
replaces=(${provides[@]})
makedepends=('subversion')
changelog=$pkgname.changelog

_svnmod=$pkgname-$pkgver
_svntrunk="http://svn.macosforge.org/repository/alac/trunk"

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

package() {
	cd $_svnmod
	install -D -m755 convert-utility/alacconvert "$pkgdir"/usr/bin/alacconvert
	install -D -m444 codec/APPLE_LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -D -m444 codec/libalac.a "$pkgdir"/usr/lib/libalac.a
}
