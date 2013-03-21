# $Id$
# Maintainer: tikysal <tikysal.archlinux.org>
# Derived from R. Haren's package

pkgname=glpk-gmp
_pkgname=glpk
pkgver=4.48
pkgrel=1
pkgdesc="GLPK with GMP."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/glpk/glpk.html"
license=('GPL')
depends=('glibc' 'gmp')
options=('!libtool')
provides=('glpk')
source=(http://ftp.gnu.org/gnu/glpk/${_pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('e00c92faa38fd5d865fa27206abbb06680bab7bb'
          '4b57f5ae0a8114c5307daa6071f9be5967a935d6')
build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-gmp

  if [ "$CARCH" == "x86_64" ]; then
    make CFLAGS="$CFLAGS -fPIC"  
  else
    make
  fi
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 doc/glpk.pdf "${pkgdir}/usr/share/doc/glpk/glpk.pdf"
  install -Dm644 doc/gmpl.pdf "${pkgdir}/usr/share/doc/glpk/gmpl.pdf"
}
