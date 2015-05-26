# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-editor
pkgver=0.3.0
pkgrel=1
pkgdesc='The Defora lightweight X11 text editor'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('defora-libsystem' 'defora-libdesktop' 'gtk2')
makedepends=('defora-configure')
source=("http://www.defora.org/os/download/download/4326/Editor-${pkgver}.tar.gz")
md5sums=('fbd67cb85cf18bbc0ce760268e9f2cb2')

build() {
  cd "$srcdir/Editor-$pkgver"
  configure
  make
}

package() {
  cd "$srcdir/Editor-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
