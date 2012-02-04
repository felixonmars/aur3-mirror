# Maintainer: shacristo <shacristo at gmail dot com>

pkgname=mingw32-blas
pkgver=3.2.1
pkgrel=1
pkgdesc="Basic Linear Algebra Subprograms (mingw32)"
arch=('i686' 'x86_64')
url="http://www.netlib.org/blas"
license=('custom')
depends=('mingw32-gcc')
source=(http://downloads.sourceforge.net/project/mingw-cross/%5BLIB%5D%20LAPACK/mingw32-lapack-3.2.1-1/mingw32-lapack-3.2.1-1.zip
	license.txt)   
md5sums=('93a0806f06ca94627f9a40189733bd06'
         '38b6acb8ed5691d25863319d30a8b365')

build() {
  cd ${srcdir}/mingw32-lapack-$pkgver-1
  rm bin/*.exe
  install -d ${pkgdir}/usr/i486-mingw32/{bin,lib}
  install -D bin/blas.dll ${pkgdir}/usr/i486-mingw32/bin/
  install -D lib/libblas.dll.a ${pkgdir}/usr/i486-mingw32/lib/
}

