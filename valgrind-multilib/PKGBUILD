# $Id: PKGBUILD 173941 2012-12-28 13:12:00Z allan $
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=valgrind-multilib
pkgver=3.8.1
pkgrel=3
pkgdesc="A tool to help find memory-management problems in programs"
arch=('x86_64')
license=('GPL')
url="http://valgrind.org/"
depends=('lib32-glibc>=2.18' 'lib32-glibc<2.19' 'perl')
makedepends=('gdb' 'gcc-multilib')
options=('!emptydirs')
provides=('valgrind')
conflicts=('valgrind')
source=(http://valgrind.org/downloads/valgrind-${pkgver}.tar.bz2
        valgrind-3.8.1-glibc-2.18.patch
        valgrind-3.8.1-ptrace-build-fix.patch)
md5sums=('288758010b271119a0ffc0183f1d6e38'
         'f3f911e6f5b0ab9d176d40b47d6cae24'
         '9d429e62255621a0c190a8180d8ab1a4')

prepare() {
  cd ${srcdir}/valgrind-${pkgver}

  patch -p1 -i $srcdir/valgrind-3.8.1-glibc-2.18.patch
  
  # based on svn commits 13471 & 13482
  patch -p0 -i $srcdir/valgrind-3.8.1-ptrace-build-fix.patch
  
  ./autogen.sh
}

build() {
  cd ${srcdir}/valgrind-${pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man

  make
}

package() {
  cd ${srcdir}/valgrind-${pkgver}
  make DESTDIR=${pkgdir} install
}
