# Contributor: Jesse Jaara <jesse.jaara@gmail.com>
pkgname=vacuummagic
pkgver=0.13a
pkgrel=1
pkgdesc="A fast-paced side-scrolling action game"
arch=('i686' 'x86_64')
url="http://apocalypse.rulez.org/vacuum/"
license=('GPL')
depends=('sdl_perl')
source=(http://downloads.sf.net/vacuum/vacuum-$pkgver.tar.gz
        vacuum.desktop)
md5sums=('f5c9ff0a59ff947204df7dd2a6018523'
         '1a4635545fad653e93c7909ff85bde3b')

build() {
  cd "$srcdir"/vacuum-0.13
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  install -D -m644 "$srcdir"/vacuum.desktop \
      "$pkgdir"/usr/share/applications/vacuum.desktop

  install -D -m644 "$srcdir"/vacuum-0.13/data/icon.png \
	"$pkgdir"/usr/share/pixmaps/vacuum.png
}
