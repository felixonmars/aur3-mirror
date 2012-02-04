pkgname=lib32-mingw-w64-glew
pkgver=1.7.0
pkgrel=2
pkgdesc="GLEW, The OpenGL Extension Wrangler Library (mingw-w64, 32-bit)"
arch=('any')
url="http://glew.sourceforge.net/"
license=('Modified BSD/MIT/GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags)
source=(http://downloads.sourceforge.net/glew/glew-${pkgver}.tgz Makefile.patch Makefile.mingw.patch)
noextract=()
md5sums=('fb7a8bb79187ac98a90b57f0f27a3e84'
         'dd09a506bcf5a0424a26d274346e8737'
         '362518879c2dfccd21ac16f00272c2d6')

build() {
  cd "$srcdir/glew-$pkgver"

  unset LDFLAGS

  patch Makefile -i "../../Makefile.patch"
  patch config/Makefile.mingw -i "../../Makefile.mingw.patch"

  echo -e "#!/bin/sh\necho mingw" > config/config.guess

  GLEW_DEST=/usr/i686-w64-mingw32/ make
}

package() {
  cd "$srcdir/glew-$pkgver"
  mkdir -p "$pkgdir/usr/i686-w64-mingw32/lib/pkgconfig"
  GLEW_DEST="$pkgdir/usr/i686-w64-mingw32" make install
}
