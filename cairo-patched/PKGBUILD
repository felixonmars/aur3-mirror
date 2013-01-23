# Maintainer: megadriver <megadriver at gmx dot com>
# Based on cairo from [extra]

pkgname=cairo-patched
pkgver=1.12.10
pkgrel=1
pkgdesc="Cairo vector graphics library (patched to fix graphical corruption in many places)"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'sh')
makedepends=('librsvg' 'poppler-glib' 'libspectre' 'gtk-doc')
optdepends=('xcb-util: for XCB backend')
conflicts=('cairo')
provides=('cairo' 'cairo-xcb')
replaces=('cairo-xcb')
options=('!libtool')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz cairo-$pkgver-xlib-source.patch)
sha1sums=('be06d5aaa272bbbd08380f71ca710d5612881493'
          '93e9d975abfcdaa0bf4f94183b67c749b56627b7')

build() {
  cd "$srcdir/cairo-$pkgver"
 
  patch -Np0 -i "$srcdir/cairo-$pkgver-xlib-source.patch"

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-tee \
	--disable-xlib-xcb
  make
}

package() {
  cd "$srcdir/cairo-$pkgver"
  make DESTDIR="$pkgdir" install
}
