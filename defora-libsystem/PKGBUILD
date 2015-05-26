# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-libsystem
pkgver=0.2.1
pkgrel=1
pkgdesc='The common lib to all Defora apps'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('openssl')
source=("http://www.defora.org/os/download/download/4351/libSystem-${pkgver}.tar.gz")
md5sums=('f4ceb5ceeff1adef41f7860c9d698866')

build() {
  cd "$srcdir/libSystem-$pkgver"
  make LDFLAGS="-ldl" PREFIX="/usr"
}

package() {
  cd "$srcdir/libSystem-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
