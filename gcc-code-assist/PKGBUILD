# Maintainer: Christophe-Marie Duquesne <chm.duquesne@gmail.com>

pkgname=gcc-code-assist
pkgver=0.1
pkgrel=4
pkgdesc="A tool that goes with gccsense, a program that allows to complete C/C++"
arch=('i686' 'x86_64')
url="http://cx4a.org/software/gccsense/"
license=('GPL3')
depends=('cloog' 'mpfr')
source=(http://cx4a.org/pub/gccsense/$pkgname-$pkgver-4.4.4.tar.bz2)
md5sums=('2f1545b6cb0265c18ffd63493c925417')

build() {
  cd "$srcdir/$pkgname-$pkgver-4.4.4"
  ./configure --prefix=/usr \
              --program-suffix=-code-assist \
              --enable-languages=c,c++ \
              --disable-bootstrap \
              --disable-multilib \
              --libdir=/usr/lib/gcc-code-assist \
              --libexecdir=/usr/lib/gcc-code-assist \
              --datadir=/usr/share/gcc-code-assist \
              --infodir=/usr/share/info/gcc-code-assist \
              --mandir=/usr/share/man/gcc-code-assist
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-4.4.4"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
