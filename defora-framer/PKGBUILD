# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-framer
pkgver=0.0.0
pkgrel=2
pkgdesc='The Defora window manager from scratch'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('libx11')
source=("http://www.defora.org/os/download/download/3291/Framer-${pkgver}.tar.gz")
md5sums=('5f3b763d5f0effa2b7971a75022ea86f')

build() {
  cd "$srcdir/Framer-$pkgver"
  make
}

package() {
  cd "$srcdir/Framer-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
