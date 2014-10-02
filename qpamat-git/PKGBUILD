# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: x11

pkgname=qpamat-git
pkgver=v0.5.4.r6.g5292d93
pkgrel=1
pkgdesc="Password manager in Qt - Mercurial version"
url="http://qpamat.berlios.de"
license="GPL"
depends=(qt4)
provides=('qpamat')
replaces=('qpamat')
makedepends=('git')
arch=('i686' 'x86_64')
source=("qpamat::git+https://bitbucket.org/bwalle/qpamat.git")
md5sums=('SKIP')

pkgver() {
  cd "qpamat"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/qpamat
  [ ! -d build ] && mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/qpamat/build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
