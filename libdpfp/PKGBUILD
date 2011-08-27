# Maintainer: Francesc Ortiz <francescortiz@gmail.com>
pkgname=libdpfp
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Linux Drivers for Microsoft and DigitalPersona fingerprint readers"
arch=('x86' 'x86_64')
url="http://dpfp.berlios.de/wikka.php?wakka=HomePage"
license=('GPL')
groups=()
depends=('libfprint')
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
source=(http://download.berlios.de/dpfp/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ebdd8492f574c34a583f66a1c593f89e') #generate with 'makepkg -g'

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
  find $pkgdir -name *.la -exec rm {} \;
}

# vim:set ts=2 sw=2 et:
