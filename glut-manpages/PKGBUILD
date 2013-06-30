# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=glut-manpages
pkgver=3.7
pkgrel=3
pkgdesc="OpenGL Utility Toolkit manpages"
arch=('any')
url="http://www.opengl.org/resources/libraries/glut/"
license=('custom')
source=('http://www.opengl.org/resources/libraries/glut/glut-3.7.tar.gz'
        'glut-3.7.patch')
md5sums=('dc932666e2a1c8a0b148a4c32d111ef3'
         '916ef8e4862e2ac6d7fb5b15fa51c3e6')

build() {
  cd $srcdir/glut-$pkgver
  patch -p1 -i $srcdir/glut-3.7.patch
  cd $srcdir/glut-$pkgver/man/glut
  make
  cd $srcdir/glut-$pkgver/man/gle
  make
}

package() {
  cd $srcdir/glut-$pkgver/man/glut
  make DESTDIR=$pkgdir install.man
  cd $srcdir/glut-$pkgver/man/gle
  make DESTDIR=$pkgdir install
}
