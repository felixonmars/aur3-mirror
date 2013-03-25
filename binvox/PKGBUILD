# Maintainer: Xtricman <xtricman@gmail.com>
pkgname=binvox
pkgver=1.17
pkgrel=1
pkgdesc="A program which can rasterizes 3D model file into into a 3D voxel file"
arch=('i686' 'x86_64')
url="http://www.cs.princeton.edu/~min/binvox"
license=('GPL')
options=(!strip)

if test "$CARCH" == i686; then
  source=("http://www.cs.princeton.edu/~min/binvox/linux32/binvox")
  md5sums=("bc26242aabec3e96dc3eb4400bc8a733")
fi

if test "$CARCH" == x86_64; then
  source=("http://www.cs.princeton.edu/~min/binvox/linux64/binvox")
  md5sums=("e09bb24dbe724eb99e572d4b866f831c")
fi

package() {
  install -D "${srcdir}/binvox" "${pkgdir}/usr/bin/binvox"
}

# vim:set ts=2 sw=2 et:
