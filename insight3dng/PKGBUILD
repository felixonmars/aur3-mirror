# Maintainer: qs9rx < that nick at enjoys dot it>
pkgname=insight3dng
pkgver=0.3.3
pkgrel=1
pkgdesc="insight3dng is an fork of insight3d. It let’s you create 3D models from photos."
arch=('i686' 'x86_64')
url="http://insight3dng.sourceforge.net/"
license=('AGPL3')
depends=(opencv lapack)
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}.tar.gz/download")
md5sums=('f41062202f6a94ae0b64eddd0630ec7f')

build() {
  cd "$srcdir/$pkgname/insight3d"
  make
}

package() {
  cd "$srcdir/$pkgname/insight3d"
  mkdir -p $pkgdir/usr/bin/
  install -m 0755 insight3d $pkgdir/usr/bin/insight3dng
}