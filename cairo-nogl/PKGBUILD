# Maintainer: Ivan Puntiy <ivan.puntiy@gmail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-nogl
_realname=cairo
pkgver=1.12.16
pkgrel=3
pkgdesc="Cairo vector graphics library, without gl support"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'sh' 'lzo2')
makedepends=('librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind')
             # for the test suite:
             # 'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
conflicts=('cairo')
provides=("cairo=$pkgver" 'cairo-xcb')
options=('!libtool')
source=(
  http://cairographics.org/releases/$_realname-$pkgver.tar.xz
  gcc-4.9-fix.patch
)
sha1sums=('4f6e337d5d3edd7ea79d1426f575331552b003ec'
          '865b1fbb5874fbabe136ec8688d5fb85c02b3109')

build() {
  cd "$srcdir/$_realname-$pkgver"

  # "Quick fix" for gcc 4.9, see: https://bugs.freedesktop.org/show_bug.cgi?id=77060
  patch -Np1 -i ../gcc-4.9-fix.patch

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-tee \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject #\
 	# --enable-gl \
	# --enable-egl \
	# --enable-test-surfaces
	
	#--disable-xlib-xcb \
	# --enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
	
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
  #make -k check || /bin/true # 162 Passed, 328 Failed [8 crashed, 10 expected], 26 Skipped
#  make test || /bin/true # 29 Passed, 464 Failed [460 crashed, 2 expected], 26 Skipped
#}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
