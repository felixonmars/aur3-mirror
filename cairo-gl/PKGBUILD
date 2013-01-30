# Maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-gl
pkgver=1.12.10
pkgrel=1
pkgdesc="Cairo vector graphics library with gl"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman' 'glib2' 'sh')
makedepends=('librsvg' 'poppler-glib' 'libspectre' 'gtk-doc') # 'libdrm')
optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo=1.12.10')
replaces=('cairo')
conflicts=('cairo')
options=('!libtool')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz)
sha1sums=('be06d5aaa272bbbd08380f71ca710d5612881493')

build() {
  cd "$srcdir/cairo-$pkgver"
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-tee \
	--disable-xlib-xcb \
	--enable-gl \
	# --enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check || /bin/true # 162 Passed, 328 Failed [8 crashed, 10 expected], 26 Skipped
#}

package() {
  cd "$srcdir/cairo-$pkgver"
  make DESTDIR="$pkgdir" install
}
