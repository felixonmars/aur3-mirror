# Maintainer: Ramil Farkhshatov <ramil.gmx.co.uk>

pkgname=mingw32-imlib2
_pkgname=imlib2
pkgver=1.4.4
pkgrel=2
pkgdesc="Library that does image file loading and saving as well as rendering, manipulation, arbitrary polygon support (mingw32)"
url="http://sourceforge.net/projects/enlightenment/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('mingw32-libtiff>=3.9.2-2' 'mingw32-freetype' \
         'mingw32-libpng>=1.4.0' 'mingw32-libjpeg>=8' 'mingw32-gcc' \
         'mingw32-w32api' 'sh')
options=('!libtool')

source=("http://downloads.sourceforge.net/enlightenment/$_pkgname-$pkgver.tar.bz2" \
        mingw32.patch)

md5sums=('b6de51879502e857d5b1f7622267a030'
         'ffe677330b97445dab9988362de10b6a')

install=mingw32-imlib2.install

build() {
  cd $srcdir/$_pkgname-$pkgver

  # disable optimizations, they cause problems (e.g. FS#12268)
  [ $CARCH = "i686" ] && EXTRAOPTS="--disable-mmx"
  [ $CARCH = "x86_64" ] && EXTRAOPTS="--disable-amd64"

  patch -p0 -i $srcdir/mingw32.patch || return 1

  unset LDFLAGS

	# HACK for libtool. Fixes building loader of png
	export lt_cv_deplibs_check_method=pass_all

  # Configure and Build
  ./configure --prefix=/usr/i486-mingw32 \
              --host=i486-mingw32 \
              --without-x \
              --enable-shared=yes \
              --enable-static=yes \
							PNG_LIBS='-L/usr/i486-mingw32/lib -lpng' \
              $EXTRAOPTS || return 1

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  # Install License
  install -Dm644 COPYING \
	        $pkgdir/usr/i486-mingw32/share/licenses/$pkgname/COPYING
}
