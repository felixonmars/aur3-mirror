# Maintainer: Weston Myers <Weston+Arch at IEEE dot org>
pkgname=qtck2launcher-git
pkgver=3a29302
pkgrel=1
pkgdesc="Launcher for Crusader Kings 2, allowing management of mods and DLC."
arch=('i686' 'x86_64')
url="https://github.com/westonmyers/Qt-CK2-Launcher"
license=('WTFPL')
#makedepends=('git')
makedepends=('git' 'qt4' 'qtwebkit')
depends=('qt4' 'qtwebkit')
source=("$pkgname"::'git+http://github.com/westonmyers/Qt-CK2-Launcher.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  qmake-qt4
  make
  make check
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 qtck2launcher ${pkgdir}/usr/bin/qtck2launcher
}