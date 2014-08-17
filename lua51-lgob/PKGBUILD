# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=lua51-lgob
pkgver=14.08
pkgrel=2
pkgdesc="Bindings of GObject-based libraries (GTK, WebKitGtk, etc) and some others like cairo, for Lua."
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org" 
depends=('lua51' 'libwebkit3' 'gtksourceview3' 'vte3' 'poppler-glib')
license=('LGPL')
source=("https://bitbucket.org/lucashnegri/lgob/downloads/lgob-$pkgver.tar.bz2")
md5sums=("6d1a78dcd87ef7cf49f316c89658f52c")

package() {
  cd "$srcdir/lgob-$pkgver"
  lua5.1 build_all.lua "$pkgdir/usr"
  
  # examples
  install -d "$pkgdir/usr/share/lgob/examples"
  install -Dm644 examples/* "$pkgdir/usr/share/lgob/examples"
}
