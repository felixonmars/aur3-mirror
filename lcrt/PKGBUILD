# Maintainer: Dagni McPhee <youremail@domain.com>
pkgname=lcrt
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="A Linux remote login tool like ssh or telnet, but it has a GUI and can manage many connections."
arch=('any')
url="http://code.google.com/p/lcrt/"
license=('GPL')
groups=()
depends=('vte-common' 'lib32-sqlite3')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://lcrt.googlecode.com/files/lcrt-1.1.1.tar.gz)
noextract=()
md5sums=('67f934e2facc5c706a50c6a0b653ad39') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
