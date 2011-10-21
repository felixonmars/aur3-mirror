# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=lv2file
pkgver=0.8
_hash='41cad16'
pkgrel=1
pkgdesc="A simple program which you can use to apply effects to your audio files without much hassle."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lv2file/"
license=('GPL')
makedepends=('lv2core')
depends=('argtable')
source=(https://github.com/jeremysalwen/lv2file/tarball/upstream/${pkgver}.tar.gz)
md5sums=('3fe28555dfcfa9b540612422257ccda8')


build() {
  cd "$srcdir/jeremysalwen-lv2file-${_hash}"

  make all
}

package() {
  cd  "$srcdir/jeremysalwen-lv2file-${_hash}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
