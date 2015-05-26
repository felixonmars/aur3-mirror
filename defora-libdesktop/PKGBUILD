# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-libdesktop
pkgver=0.2.0
pkgrel=1
pkgdesc='The common lib to all Defora desktop apps'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('defora-libsystem')
source=("http://www.defora.org/os/download/download/4355/libDesktop-${pkgver}.tar.gz")
md5sums=('ba3968e97fa198ea504f3e6cc3845407')

build() {
  cd "$srcdir/libDesktop-$pkgver"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/libDesktop-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
