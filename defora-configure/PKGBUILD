# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-configure
pkgver=0.2.1
pkgrel=1
pkgdesc='The Defora configure program for Makefile generation'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('defora-libsystem')
source=("http://www.defora.org/os/download/download/4354/configure-${pkgver}.tar.gz")
md5sums=('9bbc7dcb07a5f680c93e550d04e01977')

build() {
  cd "$srcdir/configure-$pkgver"
  make LDFLAGS="-ldl" PREFIX="/usr"
}

package() {
  cd "$srcdir/configure-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
