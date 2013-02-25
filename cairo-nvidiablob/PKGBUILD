pkgname=cairo-nvidiablob
pkgver=1.12.12
pkgrel=1
pkgdesc="Cairo vector graphics library, with workaround for slow gtk2 apps with buggy nvidia blobs"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman' 'glib2' 'sh')
makedepends=('librsvg' 'poppler-glib' 'libspectre' 'gtk-doc') # 'libdrm')
optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo=$pkgver' 'cairo-xcb=$pkgver')
replaces=('cairo' 'cairo-xcb')
conflicts=('cairo' 'cairo-xcb')
options=('!libtool')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz
        cairo-1.10.0-buggy_gradients.patch
)

md5sums=('9f7315e54885c735dcfdabe77f322d30'
         '9b323790dab003e228c6955633cb888e')

build() {
  cd "$srcdir/cairo-$pkgver"
  patch -Np1 -i ${srcdir}/cairo-1.10.0-buggy_gradients.patch


  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-tee \
	--disable-xlib-xcb \
	# --enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
  make
}

package() {
  cd "$srcdir/cairo-$pkgver"
  make DESTDIR="$pkgdir" install
}
