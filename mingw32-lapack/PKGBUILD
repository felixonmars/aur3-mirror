# Maintainer: shacristo <shacristo at gmail dot com>

pkgname=mingw32-lapack
pkgver=3.2.1
pkgrel=1
pkgdesc="Linear Algebra PACKage (mingw32)"
arch=('i686' 'x86_64')
url="http://www.netlib.org/lapac"
license=('custom')
depends=('mingw32-blas')
source=(http://downloads.sourceforge.net/project/mingw-cross/%5BLIB%5D%20LAPACK/mingw32-lapack-3.2.1-1/mingw32-lapack-3.2.1-1.zip)
md5sums=('93a0806f06ca94627f9a40189733bd06')
         
build() {
  cd ${srcdir}/$pkgname-$pkgver-1
  rm bin/*.exe
  install -d ${pkgdir}/usr/i486-mingw32/{bin,lib}
  install -D bin/lapack.dll ${pkgdir}/usr/i486-mingw32/bin/
  install -D lib/liblapack.dll.a ${pkgdir}/usr/i486-mingw32/lib/
}

