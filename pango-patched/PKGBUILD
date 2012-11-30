# Maintainer: ndt <ntypanski@gmail.com>
pkgname=pango-patched
_realname=pango
pkgver=1.32.1
pkgrel=1
pkgdesc="Patches Pango 1.32.1 to fix x shutdown error."
arch=('i686' 'x86_64')
url="http://gnome.org/"
license=('GPL')
groups=()
depends=('cairo' 'harfbuzz' 'libthai' 'libxft' 'freetype2' 'gobject-introspection')
makedepends=('sed' 'libxt' 'gtk-doc')
provides=('pango')
conflicts=('pango')
replaces=()
backup=()
options=('!libtool')
install=
source=(http://ftp.gnome.org/pub/GNOME/sources/pango/1.32/$_realname-$pkgver.tar.xz)
noextract=()
md5sums=('73570ab28462fc43960a8d1ffdae43d0')

build() {
  cd "$srcdir/$_realname-$pkgver"
  cd ./pango
  sed -e 's/display == display)/display == display){G_UNLOCK(fontmaps);/' \
    -e 's/pango_xft_shutdown_display (display, xftfontmap->screen);/pango_xft_shutdown_display (display, xftfontmap->screen); G_LOCK (fontmaps);}/' <pangoxft-fontmap.c >pangoxft-fontmap.new
  mv pangoxft-fontmap.new pangoxft-fontmap.c
  cd ..
  #
  # BUILD HERE
  #
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --with-included-modules=basic-fc
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --with-included-modules=basic-fc
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
