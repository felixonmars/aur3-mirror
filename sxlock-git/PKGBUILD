# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=sxlock-git
_pkgname=sxlock
pkgver=v1.0
pkgrel=1
pkgdesc="Simple screen locker utility for X, fork of sflock. Uses PAM authentication, no suid needed."
arch=('i686' 'x86_64')
url="https://github.com/lahwaacz/sxlock"
license=('MIT')
depends=('libxext')
makedepends=('git')
source=('git://github.com/lahwaacz/sxlock.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
