# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libqxt-tip
pkgver=0.6.99
pkgrel=1
pkgdesc="provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit (development version)"
arch=('i686' , 'x86_64')
url="http://www.libqxt.org/"
license=('GPL')
groups=()
depends=('qt' 'openssl' 'db')
makedepends=('qt')
optdepends=()
provides=('libqxt')
conflicts=('libqxt')
replaces=('libqxt')
backup=()
options=()
install=
changelog=
source=(http://dev.libqxt.org/libqxt/get/tip.tar.gz)
noextract=()
md5sums=('d47056d63f4e7fe90e874ba8aa57e629') #generate with 'makepkg -g'

build() {
  DIR=$srcdir/libqxt*
  for i in $DIR; do
    DIR=$i
  done
  cd "$DIR"

  ./configure -prefix /usr
  make
}

package() {
  DIR=$srcdir/libqxt*
  for i in $DIR; do
     DIR=$i
  done
  cd "$DIR"

  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
