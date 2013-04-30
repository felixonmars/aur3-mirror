# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=okularplugin-git
pkgver=10.e6c3993
pkgrel=1
pkgdesc="KParts-based Okular plugin designed to work as a Firefox compatible plugin"
arch=('i686' 'x86_64')
url="http://github.com/jeremysanders/okularplugin"
license=('LGPL')
depends=('kdegraphics-okular')
makedepends=('git' 'automoc4' 'cmake')
source=('okularplugin::git+http://github.com/jeremysanders/okularplugin.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/okularplugin"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/okularplugin"

  cmake -DDATA_INSTALL_DIR=/usr/share/apps/ -DCMAKE_SKIP_RPATH=ON .
  make
}

package() {
  cd "$srcdir/okularplugin"

  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir"/usr/lib/mozilla/plugins/
  mv "$pkgdir"/usr/lib/libokularplugin.so "$pkgdir"/usr/lib/mozilla/plugins/
  mv "$pkgdir"/usr/share/apps/okularplugin "$pkgdir"/usr/share/apps/kde
} 
