# Contributor: Andre Klitzing <aklitzing () online () de>
# Contributor: schalaalexiazeal@gmail.com
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=wxMSW
_target=i486-mingw32
pkgname=mingw32-wxmsw
pkgver=2.8.12
pkgrel=4
pkgdesc="Win32 implementation of wxWidgets API for GUI (mingw32, shared+static)"
arch=('any')
url="http://docs.wxwidgets.org/stable/wx_wxmswport.html"
license=('custom:wxWindows')
depends=('mingw32-runtime' 'mingw32-libpng' 'mingw32-zlib')
makedepends=('mingw32-w32api' 'mingw32-gcc' 'mingw32-binutils' 'hd2u')
provides=('mingw32-wxmsw-static')
options=(!strip !buildflags)
install=wxmsw.install
source=(http://downloads.sourceforge.net/wxwindows/$_pkgname-$pkgver.tar.bz2)
md5sums=('4bda849b9f7c66b58c4bc92e505ea714')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	CONFIGURE_OPTS="--prefix=/usr/${_target} --host=${_target}
		--with-msw
		--with-opengl
		--without-expat
		--disable-compat26
		--enable-dataobj
		--enable-threads
		--enable-longlong
		--enable-unicode"

	# Configure as shared, then build and install
	./configure $CONFIGURE_OPTS \
		--enable-shared
	make $MAKEFLAGS
	make DESTDIR="$pkgdir/" install

	# Reconfigure as static, then re-link and install
	./configure $CONFIGURE_OPTS \
		--disable-shared
	make $MAKEFLAGS
	make DESTDIR="$pkgdir/" install

	# Put DLLs in correct place
	mv "$pkgdir/usr/${_target}/lib/"*.dll "$pkgdir/usr/${_target}/bin/"

	msg "Get rid of stupid carriage return (^M problem) in all text files!"
	cd "$pkgdir/"
	find ./ -type f -exec dos2unix --d2u --skipbin {} \;
}

