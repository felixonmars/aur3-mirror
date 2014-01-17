# Maintainer: George Hilliard (gh403 at msstate dot edu)

pkgname=titools
pkgver=0.2
pkgrel=1
pkgdesc="A collection of simple command-line programs for communicating with a TI calculator."
arch=('i686' 'x86_64')
url="https://github.com/Jonimoose/TITools"
license=('GPL3')
groups=()
depends=('libticalcs')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/Jonimoose/TITools/archive/v"$pkgver".tar.gz")
noextract=()
md5sums=('04e022973bed42f1e02f261e08cfcb4c')

build() {
  cd $srcdir/TITools-$pkgver # cheating with name
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/TITools-$pkgver
  make DESTDIR=$pkgdir install
}
