# Contributor: Daniel Kirchner <mokaga@lavabit.com>
pkgname=openctm
pkgver=1.0.3
pkgrel=2
pkgdesc="An open file format for storing compressed triangle meshes."
url="http://openctm.sourceforge.net/"
arch=('i686' 'x86_64')
license=('custom')
depends=('gtk2' 'glut')
makedepends=('gcc' 'make')
source=('http://downloads.sourceforge.net/openctm/OpenCTM-1.0.3-src.tar.bz2')
md5sums=('55948e7c2ad8c5807cd1b9b48718075b')

build() {
  cd $srcdir/OpenCTM-$pkgver

  sed -i -e 's/-lglut/-lglut -lGLU -lGL/' tools/Makefile.linux

  install -d $pkgdir/usr/{lib,include,bin,man/man1}

  make LIBDIR=$pkgdir/usr/lib INCDIR=$pkgdir/usr/include BINDIR=$pkgdir/usr/bin MAN1DIR=$pkgdir/usr/share/man/man1 -f Makefile.linux
  make LIBDIR=$pkgdir/usr/lib INCDIR=$pkgdir/usr/include BINDIR=$pkgdir/usr/bin MAN1DIR=$pkgdir/usr/share/man/man1 -f Makefile.linux install
}
