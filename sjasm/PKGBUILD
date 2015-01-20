# Maintainer: Víctor M. <samsaga2@gmail.com>
pkgname=sjasm
pkgver=0.42
pkgrel=6
epoch=
pkgdesc="Sjasm Z80 assembler"
arch=('i686' 'x86_64')
url="http://home.online.nl/smastijn/sjasm.html"
license=('GPL')
groups=()
depends=()
makedepends=('cmake' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("sjasm::git+http://github.com/samsaga2/sjasm")
noextract=()
md5sums=('SKIP')
 
build() {
  cd "$srcdir/sjasm"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release .
  make
}
 
package() {
  cd "$srcdir/sjasm"
  make DESTDIR="${pkgdir}" install
}
