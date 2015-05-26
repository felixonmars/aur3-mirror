# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-browser
pkgver=0.4.13
pkgrel=1
pkgdesc='The Defora lightweight file browser'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('defora-libsystem' 'defora-libdesktop' 'gtk2')
makedepends=('defora-configure')
source=("http://www.defora.org/os/download/download/4310/Browser-${pkgver}.tar.gz")
md5sums=('a2e7f655d8b6e7cbbdb666c8b2b09baa')

build() {
  cd "$srcdir/Browser-$pkgver"
  configure
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/Browser-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
