# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: bubla <matej.tyc@gmail.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>

pkgname=mingw32-libjpeg
pkgver=8.3.0
_pkgver=8d
pkgrel=1
pkgdesc="Library of JPEG support functions"
arch=('any')
url="http://www.ijg.org/"
license=('custom')
depends=()
makedepends=('mingw32-gcc' 'mingw32-w32api')
options=('!strip' '!buildflags')
source=(http://www.ijg.org/files/jpegsrc.v${_pkgver}.tar.gz)
md5sums=('52654eb3b2e60c35731ea8fc87f1bd29')

_prefix='/usr/i486-mingw32'
build() {
  cd $srcdir/jpeg-${_pkgver}

  # mingw32 have problems with --hash-style=gnu (default value)
  unset LDFLAGS
  ./configure --host=i486-mingw32 --prefix=$_prefix --mandir=/usr/i486-mingw32/share/man
  make
}

package() {
  #alias '/usr/bin/strip=i486-mingw32-strip'
  cd $srcdir/jpeg-${_pkgver}
  make DESTDIR=$pkgdir install
  
  # See FS#11116 - re-assess current need sometime...
  install -m644 jpegint.h $pkgdir/$_prefix/include

  install -Dm644 README $pkgdir/$_prefix/share/licenses/libjpeg/README
}

