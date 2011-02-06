# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ceres3
pkgver=0.28a9
pkgrel=1
pkgdesc="A simple cut-and-paste spectral sound editor."
arch=(i686 x86_64)
url="http://www.music.columbia.edu/~stanko/About_Ceres3.html"
license=('GPL')
depends=('nas' 'lesstif' 'audiofile')
source=("http://www.music.columbia.edu/~stanko/downloads/$pkgname-source.tar.gz")
md5sums=('fec9d05bd82a20f50b86fdf270e55105')

build() {
  cd "$srcdir/$pkgname-source"

  # include limits.h
  sed -i "152i#include<limits.h>" $pkgname.c

  make -f makefile.linux_ix86
}

package() {
  cd "$srcdir/$pkgname-source"

  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
