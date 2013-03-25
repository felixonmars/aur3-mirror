# Maintainer: Xtricman <xtricman@gmail.com>
pkgname=viewvox
pkgver=0.42
pkgrel=1
pkgdesc="A program that reads a 3D voxel file and show it in a window"
arch=('i686' 'x86_64')
url="http://www.cs.princeton.edu/~min/viewvox"
license=('GPL')
options=(!strip)

if test "$CARCH" == i686; then
  source=("http://www.cs.princeton.edu/~min/viewvox/linux32/viewvox")
  md5sums=("c3bb11d419a8739ca56d46674f6dcec7")
fi

if test "$CARCH" == x86_64; then
  source=("http://www.cs.princeton.edu/~min/viewvox/linux64/viewvox")
  md5sums=("bd9de3ad22c4b294d263a45374b8e757")
fi

package() {
  install -D "${srcdir}/viewvox" "${pkgdir}/usr/bin/viewvox"
}

# vim:set ts=2 sw=2 et:
