# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Contributor: Chris Brannon <cmbrannon (at) cox.net>

pkgname=pcc-cvs
pkgver=20141018
pkgrel=1
pkgdesc="Portable C Compiler."
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom')
depends=('pcc-libs')
makedepends=('cvs')
provides=(pcc)
conflicts=(pcc)
options=(staticlibs)
source=(license)
md5sums=('51f6cc02b26af53f26cfe87494ca5c87')

_cvsroot=":pserver:anonymous@pcc.ludd.ltu.se:/cvsroot"
_cvsmod="pcc"

prepare() {
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
}

build() {
  cd "$srcdir/$_cvsmod-build"

  ./configure --prefix=/usr --libexecdir=/usr/lib/pcc
  make CC=gcc
}

package() {
  cd "$srcdir/$_cvsmod-build"

  make DESTDIR=$pkgdir install

  cd "$pkgdir/usr/share/man/man1"
  mv ${pkgdir}/usr/share/man/man1/cpp.1 ${pkgdir}/usr/share/man/man1/cpp.1pcc

  install -D -m0644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
