# Contributor: josedavim <josedtascon@gmail.com>

pkgname=sba
pkgver=1.6
pkgrel=1
pkgdesc="A Generic Sparse Bundle Adjustment C/C++ Package Based on the Levenberg-Marquardt Algorithm"
arch=('i686' 'x86_64')
url="http://www.ics.forth.gr/~lourakis/sba/"
license=('BSD')
makedepends=('gcc-libs' 'cmake')
depends=('lapack>=3.4' 'blas>=3.4' 'f2c>=1.0')
#optdepends=('' )
source=("http://www.ics.forth.gr/~lourakis/sba/sba-1.6.tgz")
md5sums=('479ebcaac73d8d3ddc2665a0fe24f94b')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr')

if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
else
  _platform=x86
fi

build() {
  cd $srcdir/$pkgname-$pkgver
  # DEFINE CMAKE VERSION
  sed -i -e's/#CMAKE_MINIMUM_REQUIRED(VERSION 1.4)/CMAKE_MINIMUM_REQUIRED(VERSION 2.8)/' CMakeLists.txt
  sed -i -e's/${F2C_LIB}/${F2C_LIB} m/' ./demo/CMakeLists.txt
  mkdir -p ./sba-bin/
  cd ./sba-bin/
  cmake ${_cmakeopts[@]} ../
  make
}

package ()
{
  cd $srcdir/$pkgname-$pkgver/
  #make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include/
  mkdir -p $pkgdir/usr/bin/
  
  cp -a ./sba-bin/libsba.a $pkgdir/usr/lib/
  cp -a ./sba.h ./sba_chkjac.h ./compiler.h $pkgdir/usr/include/
  cp -a ./sba-bin/demo/eucsbademo $pkgdir/usr/bin/
  
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
