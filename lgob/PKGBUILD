# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=lgob
pkgver=13.10
pkgrel=1
pkgdesc="Bindings of GObject-based libraries (GTK, WebKitGtk, etc) and some others like cairo, for Lua."
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org" 
depends=('lua51' 'libwebkit3' 'gtksourceview3' 'clutter-gtk' 'vte3' 'poppler-glib')
license=('LGPL')
source=("https://bitbucket.org/lucashnegri/$pkgname/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=("b1418d2c77f5286be6a5c56a579c1b9c")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  lua5.1 build_all.lua "$pkgdir/usr"
  
  # examples
  install -d "$pkgdir/usr/share/lgob/examples"
  install -Dm644 examples/* "$pkgdir/usr/share/lgob/examples"
}
