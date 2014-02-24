# Contributor: josetascon <josedtascon@gmail.com>

pkgname=klt
pkgver=1.3.4
pkgrel=1
pkgdesc="KLT: An Implementation of the Kanade-Lucas-Tomasi Feature Tracker"
arch=('i686' 'x86_64')
url="http://www.ces.clemson.edu/~stb/klt/"
license=('custom')
makedepends=('gcc-libs')
# depends=('')
# optdepends=('')
options=('staticlibs')
source=('http://www.ces.clemson.edu/~stb/klt/klt1.3.4.zip')
md5sums=('784776f0160acc4f73c88b01bdf88053')

if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
else
  _platform=x86
fi

build() {
  cd "$srcdir/$pkgname"
  make
}

package ()
{
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp -a ./libklt.a $pkgdir/usr/lib
  cp -a ./klt.h ./klt_util.h $pkgdir/usr/include
}
