# Maintainer: Iip Umar Rifai <iip.umar.rifai@gmail.com>
pkgname=harbour-git
pkgver=20150408
pkgrel=1
pkgdesc="Harbour is the free software implementation of a multi-platform, multi-threading, object-oriented, scriptable programming language, backward compatible with Clipper/xBase."
arch=('i686' 'x86_64')
url="http://harbour.github.io/"
license=('GPL')
groups=('devel')
depends=('qt5-base' 'slang' 'ncurses' 'gpm' 'libmariadbclient' 'lib32-sqlite3' 'libjpeg-turbo' 'libpng12' 'libx11' 'openssl' 'pcre' 'zlib')
#'firebird' 'freeimage' 'allegro'
makedepends=('gcc'  'git' 'pkgconfig')
optdepends=()
provides=('harbour')
conflicts=('harbour')
replaces=()
backup=()
options=()
#install=harbour.install
changelog=
source=(https://github.com/harbour/core/archive/master.tar.gz)
noextract=()
md5sums=('SKIP')
#         '724198b83bbabdc06a95353d04b18c08')

build() {
  cd "$srcdir/core-master"
  #HB_WITH_MXL still have error
  export HB_WITH_MXML=no
  
  make
}

package() {
  cd "$srcdir/core-master"

  make DESTDIR="$pkgdir/" install
}
