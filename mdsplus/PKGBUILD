# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=mdsplus
pkgver=5.2
pkgrel=1
pkgdesc="MDSplus is a set of software tools for data acquisition and storage and a methodology for management of complex scientific data"
arch=('i686' 'x86_64')
url="http://www.mdsplus.org"
license=('BSD')
depends=('java-environment')
makedepends=('gcc-fortran')
source=(http://www.mdsplus.org/dist/fc15/stable/SOURCES/mdsplus-${pkgver}.tar.gz
Makefile.in.patch)
md5sums=('7fe2ca8460a041f25ffda14c65b4e8e4'
         '336b3300ec8c3ec7b555f992d4e03742')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ../Makefile.in.patch
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=$pkgdir/opt/mdsplus --with-jdk=$JAVA_HOME
  make LD=gcc
}

package() {
  cd "$srcdir/$pkgname"
  make install
}

# vim:set ts=2 sw=2 et:
