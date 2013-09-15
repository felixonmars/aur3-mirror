# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=rexloader-svn
pkgver=336
pkgrel=1
pkgdesc="A cross-platform download manager."
url="https://code.google.com/p/rexloader/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qtwebkit')
makedepends=('subversion')
source=(svn+http://rexloader.googlecode.com/svn/trunk/)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/trunk
  svnversion | tr -d [A-z]
}

prepare() {
  cd trunk/
  qmake-qt4
}

build() {
  cd trunk/
  make
}

package() {
  cd trunk/
  cp -r usr/ $pkgdir

  # Desktop icon
  cd REXLoader
  install -Dm644 rexloader.png $pkgdir/usr/share/pixmaps/rexloader.png
  install -Dm644 rexloader.desktop $pkgdir/usr/share/applications/rexloader.desktop
}