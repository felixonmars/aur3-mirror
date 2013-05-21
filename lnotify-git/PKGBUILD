# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=lnotify-git
_pkgname=lnotify
pkgver=25.0edf5a5
pkgrel=1
pkgdesc="Simple bind from libnotify to Lua"
arch=('i686' 'x86_64')
url="https://github.com/gabrield/lnotify"
provides=('lnotify')
conflicts=('lnotify')
license=('MIT')
depends=(lua libnotify)
source=('git://github.com/gabrield/lnotify.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 notify.so $pkgdir/usr/lib/lua/5.2/notify.so
  mkdir -p $pkgdir/usr/share/doc/lnotify
  install -Dm 644 test/* -t $pkgdir/usr/share/doc/lnotify/
}
