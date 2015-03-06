# $Id: PKGBUILD 232886 2015-03-05 11:49:18Z jgc $

pkgname=flaxpdf-git
pkgver=20150305
pkgrel=1
pkgdesc="A simple FLTK PDF viewer"
arch=('i686' 'x86_64')
url="https://github.com/clbr/flaxpdf"
license=('GPL3')
depends=('fltk' 'poppler' 'lzo')
makedepends=('automake' 'autoconf')

source=(git://github.com/clbr/flaxpdf.git)
sha256sums=('SKIP')

build() {
  cd flaxpdf

  mkdir -p config
  touch config/config.rpath
  ./autogen.sh

  # ensure gcc because clang doesn't support OpenMP yet
  CC=gcc CXX=g++ ./configure --prefix=/usr 

  make
}

package() {
  cd flaxpdf
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
