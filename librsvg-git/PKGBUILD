# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=librsvg-git
pkgver=2.40.9.r8.gfb19e50
pkgrel=1
pkgdesc="A SVG viewing library"
arch=(i686 x86_64)
url="https://live.gnome.org/LibRsvg"
license=('LGPL')
depends=('gdk-pixbuf2' 'pango' 'libcroco')
makedepends=('git' 'intltool' 'gtk3' 'gobject-introspection' 'gtk-doc' 'vala' 'gnome-common')
optdepends=('gtk3: for rsvg-view-3')
provides=('librsvg')
conflicts=('librsvg')
options=('!emptydirs')
install=librsvg.install
source=("$pkgname"::'git+https://git.gnome.org/browse/librsvg'
        'librsvg.install')
md5sums=('SKIP'
         'a31cb604fde7c167bc20634942772a44')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  
  ./autogen.sh --prefix=/usr --disable-static --enable-vala --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
