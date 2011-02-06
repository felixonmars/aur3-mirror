# Maintainer: Alex Ghoust <ghouts@skyper.homelinux.org>

pkgname=mingw32-paragui
pkgver=1.1.8
pkgrel=1
pkgdesc="Graphics library for programms using SDL (mingw32)"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/paragui/"
license=('LGPL')
groups=()
depends=('mingw32-sdl>=1.2.0' 'mingw32-freetype>=2.0.3' 'mingw32-zlib' 'mingw32-libpng' 'mingw32-sdl_image>=1.2.0'
		'mingw32-expat>=1.95.1')
source=("http://ftp.twaren.net/Unix/NonGNU/paragui/paragui-$pkgver.tar.gz"
		"patch.diff")
md5sums=('6741b8f704b47b2c6b62fef29759c89c'
         '15af25a09967fb08222d7e0d30787003')

build() {
  cd "$srcdir/paragui-$pkgver"
  unset LDFLAGS
  patch -p1 -i "${srcdir}/patch.diff" || return 1
  export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
  export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig"
  ./configure  --prefix=/usr/i486-mingw32 --build=i686-pc-linux-gnu --target=i486-mingw32 --host=i486-mingw32 --enable-internalphysfs --enable-unicode || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
