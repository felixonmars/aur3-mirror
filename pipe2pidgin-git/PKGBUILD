# Maintainer: Max Rosin <archlinux at maxrosin dot com>
pkgname=pipe2pidgin-git
pkgver=20141002
pkgrel=1
pkgdesc="Pipe something to Pidgin."
arch=('any')
url="https://github.com/ekeih/pipe2pidgin"
license=('GPL')
depends=('python2-dbus')
makedepends=('git')

_gitbase="git://github.com/ekeih/pipe2pidgin.git"

build() {
  git clone $_gitbase $pkgname-$pkgver
}

package() {
  install -D "$srcdir/$pkgname-$pkgver/pipe2pidgin" "$pkgdir/usr/bin/pipe2pidgin"
}
