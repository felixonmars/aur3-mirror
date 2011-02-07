# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=tekui
pkgname=$_pkg-snapshot
pkgver=02.07.2011
pkgrel=1
pkgdesc="A small, freestanding and portable graphical user interface (GUI) toolkit written in Lua and C."
arch=(i686 x86_64)
url="http://tekui.teklib.org/"
license=('GPL')
depends=('lua' 'freetype2' 'libx11' 'libxft' 'fontconfig' 'libxxf86vm')
optdepends=('directfb: directfb driver support')
provides=("$_pkg")
conflicts=("$_pkg")
source=("${url}releases/${pkgname}.tgz")
md5sums=(`wget -qO- $source | md5sum | cut -c -32`)

build() {
  cd "$srcdir/$pkgname"

  sed -i "s| /usr/local| $pkgdir/usr|" config
  make all
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install

  # Install docs and demos
  install -d "$pkgdir/usr/share/"{$_pkg/demos,doc/$_pkg}
  install -Dm 644 doc/* "$pkgdir/usr/share/doc/$_pkg"
  cp -a bin/* "$pkgdir/usr/share/$_pkg/demos"

  # Setting a reasonable package version
  pkgver=`stat -Lc @%Y $srcdir/$pkgname.tgz | date -f - "+%m.%d.%Y"`
}

# vim:set ts=2 sw=2 et:
