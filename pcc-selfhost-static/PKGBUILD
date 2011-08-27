# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=pcc-selfhost-static
pkgver=1.1.0.DEVEL
pkgrel=1
pkgdesc="Self-hosting Portable C Compiler"
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom:BSD')
provides=('pcc')
conflicts=('pcc')
depends=('pcc' 'pcc-libs-selfhost' 'libbsd-git')
makedepends=('cvs')
source=('configure.patch')
md5sums=('5ef68a7aa7db479cdfcc0288a8f0142e')

_cvsroot=":pserver:anonymous@pcc.ludd.ltu.se:/cvsroot"

build() {
#some build environment stuff defined
  export CC="pcc -nostdlib"
  export CFLAGS="-xdce -xssa -O -static -I/usr/lib/pcc/${CARCH}-unknown-linux-gnu/$pkgver/include -L/usr/lib/pcc/${CARCH}-unknown-linux-gnu/$pkgver/lib -L/usr/lib -I/usr/include"

  cd "$srcdir"

  msg "Building PCC"
  cd "$srcdir"

  msg "Connecting to CVS server...."
  if [ -d pcc/CVS ]; then
    cd pcc
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f pcc
    cd pcc
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/pcc-build"
  cp -ar "$srcdir/pcc" "$srcdir/pcc-build"
  cd "$srcdir/pcc-build"
  patch -p0 configure -i $srcdir/configure.patch

#setting up new build environment variables
  export CC_FOR_BUILD="pcc"
  ./configure --prefix=/usr --libexecdir=/usr/lib/pcc/ || return 1

  make || return 1

  make DESTDIR=$pkgdir install || return 1
  cd "$pkgdir/usr/share/man/man1"

  mv ${pkgdir}/usr/share/man/man1/cpp.1 ${pkgdir}/usr/share/man/man1/cpp.1pcc
}
