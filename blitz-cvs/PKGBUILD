# Maintainer: bastikr <basti.kr@gmail.com>

pkgname=blitz-cvs
pkgver=20101125
pkgrel=1
pkgdesc="C++ Class library for scientific computing"
arch=('i686' 'x86_64')
url="http://www.oonumerics.org/blitz/"
license=('GPL''custom')
depends=('gcc')
makedepends=('cvs')
options=('!docs' '!libtool')
source=()
md5sums=()
provides=('blitz')
conflicts=('blitz')

_cvsroot=":pserver:anonymous@blitz.cvs.sourceforge.net:/cvsroot"
_cvsmod="blitz"

build() {
  cd $srcdir
  if [ -d ${_cvsmod}/CVS ]; then
    cd ${_cvsmod}
    cvs -q update -dA
  else
    cvs -q -z3 -d${_cvsroot}/${_cvsmod} co ${_cvsmod}
    cd ${_cvsmod}
  fi

  autoreconf -vif

  # Install license
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

  ./configure CXX=g++ --prefix=/usr --enable-64bit --enable-html-docs=no --enable-doxygen=no|| return 1
  make DESTDIR=$startdir/pkg install || return 1
  rm -rf $pkgdir/usr/lib/pkgconfig
}
