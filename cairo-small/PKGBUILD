# $Id$
# Maintainer: PyroDevil <p dot devil at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-small
pkgver=1.12.16
pkgrel=1
pkgdesc="Cairo vector graphics library without OpenGl or OpenEGL support (no need for mesa)"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
# depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa>=9.1' 'libgl' 'sh') 
makedepends=('librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'valgrind'
             # for the test suite:
             'ttf-dejavu' 'gsfonts' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=("cairo=$pkgver" "cairo-xcb=$pkgver" "cairo-tee=$pkgver")
conflicts=('cairo' 'cairo-xcb' 'cairo-tee')
options=('!libtool')
source=(http://cairographics.org/releases/${pkgname:0:5}-$pkgver.tar.xz)
sha1sums=('4f6e337d5d3edd7ea79d1426f575331552b003ec')

build() {
  cd "$srcdir/${pkgname:0:5}-$pkgver"
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-tee \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject #\
	#--enable-gl #\
	#--enable-egl #\
	# --enable-test-surfaces
	
	#--disable-xlib-xcb \
	# --enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
	
  make
}

#check() {
#  cd "$srcdir/${pkgname0:5}-$pkgver"
  #make -k check || /bin/true # 162 Passed, 328 Failed [8 crashed, 10 expected], 26 Skipped
#  make test || /bin/true # 29 Passed, 464 Failed [460 crashed, 2 expected], 26 Skipped
#}

package() {
  depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'lzo2') 

  cd "$srcdir/${pkgname:0:5}-$pkgver"
  make DESTDIR="$pkgdir" install
}


