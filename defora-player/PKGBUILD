# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-player
pkgver=0.1.6
pkgrel=1
pkgdesc='The Defora lightweight mplayer frontend'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('defora-libdesktop' 'gtk2' 'mplayer')
source=("http://www.defora.org/os/download/download/4297/Player-${pkgver}.tar.gz")
md5sums=('7ec36a28e6fb95ef985d913525ea7cb9')

build() {
  cd "$srcdir/Player-$pkgver"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/Player-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
