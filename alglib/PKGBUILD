# Contributor: Carlo Casta <carlo.casta at gmail dot com>

pkgname=alglib3
pkgver=3.4.0
pkgrel=1
pkgdesc="A cross-platform numerical analysis and data processing library (third version)"
arch=('i686' 'x86_64')
url="http://www.alglib.net"
license=('GPL')
depends=('gmp' 'mpfr')
source=(http://www.alglib.net/translator/re/alglib-${pkgver}.cpp.zip)
md5sums=('e077d0eca7f0983e90a6faf25ae49d62')

build()
{
  cd ${srcdir}/cpp/src

  # make static lib
  gcc -I. -c *.cpp || return 1
  ar rcs libalglib.a *.o || return 1

  # make shared lib
  rm -f *.o
  gcc -I. -fPIC -c *.cpp || return 1
  gcc -shared -Wl,-soname,libalglib.so.2 -o libalglib.so.${pkgver} *.o


  # install docs
  install -d ${pkgdir}/usr/share/doc/alglib
  install ../manual.cpp.html ${pkgdir}/usr/share/doc/alglib

  # install headers
  install -d ${pkgdir}/usr/include/libalglib
  install *.h ${pkgdir}/usr/include/libalglib

  # install library
  install -d ${pkgdir}/usr/lib
  install libalglib.a ${pkgdir}/usr/lib
  install libalglib.so.${pkgver} ${pkgdir}/usr/lib
  ln -s libalglib.so.${pkgver} ${pkgdir}/usr/lib/libalglib.so.2
  ln -s libalglib.so.${pkgver} ${pkgdir}/usr/lib/libalglib.so
}
