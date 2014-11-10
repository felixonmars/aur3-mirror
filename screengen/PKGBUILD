# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=screengen
pkgver=1.8
pkgrel=2
pkgdesc="Command line thumbnail generator from a video file."
arch=('i686' 'x86_64')
url="http://kochkin.tk/doku.php/screengen/start"
license=('GPL3')
depends=('ffmpeg' 'qt4')
source=(http://kochkin.tk/lib/exe/fetch.php/$pkgname/$pkgname-$pkgver-20140909.tar.bz2)
md5sums=('a5dc4cb5a43338d19a6fa38de9478a36')

prepare() {
  cd $srcdir/$pkgname
  qmake-qt4
}

build() {
  cd $srcdir/$pkgname
  make
}

package() { 
  cd $srcdir/$pkgname 
  make INSTALL_ROOT=$pkgdir install
}