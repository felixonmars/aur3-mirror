# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-surfer
pkgver=0.2.6
pkgrel=1
pkgdesc='The Defora lightweight webkit surfer'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('defora-libsystem' 'defora-libdesktop' 'gtk2' 'libwebkit')
source=("http://www.defora.org/os/download/download/3709/Surfer-${pkgver}.tar.gz")
md5sums=('390732796b122d8ea828f9ac68e44aa2')

build() {
  cd "$srcdir/Surfer-$pkgver"
  make
}

package() {
  cd "$srcdir/Surfer-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
