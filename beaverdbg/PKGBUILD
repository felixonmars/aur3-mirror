
# Maintainer: M0Rf30

pkgname=beaverdbg
pkgver=1.0.0.b3
pkgrel=1
pkgdesc="Beaver Debugger is free cross-platform debugger in QT (GDB frontend). "
arch=('i686' 'x86_64')
url="http://code.google.com/p/beaverdbg/"
license=('LGPL')
depends=('qt' 'gdb')
source=("http://beaverdbg.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('3fc190233d96fda23a97f20bfd250fc8')

build() {
#  cd $srcdir/${pkgname}-${pkgver}
  cd $srcdir/${pkgname}-1.0.0.b2
  qmake  BEAVER_LINK_PREFIX=/usr BEAVER_PREFIX=/usr INSTALL_DIR=$pkgdir || return 1
  make || return 1
  make INSTALL_ROOT="${pkgdir}" install  
}
