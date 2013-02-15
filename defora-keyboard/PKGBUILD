# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-keyboard
pkgver=0.2.1
pkgrel=1
pkgdesc='The Defora on-screen keyboard'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('gtk2')
source=("http://www.defora.org/os/download/download/3696/Keyboard-${pkgver}.tar.gz")

build() {
  cd "$srcdir/Keyboard-$pkgver"
  make
}

package() {
  cd "$srcdir/Keyboard-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
md5sums=('0b6f500e26260ee98843f52877464d28')
