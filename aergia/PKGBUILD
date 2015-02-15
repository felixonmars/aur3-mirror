# Maintainer:  <aaron.l.france@gmail.com>
pkgname=aergia
pkgver=1
pkgrel=1
pkgdesc="Uses LXC to run short-lived containers and run tests on it."
arch=('i686' 'x86_64')
url="https://github.com/Ralt/aergia.git"
license=('MIT')
makedepends=()
checkdepends=()
optdepends=()
provides=('aergia')

options=('!strip')
source=('git://github.com/Ralt/aergia.git')
md5sums=('SKIP')


build() {
  cd $pkgname
  make
}


package() {
  cd $pkgname
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/man/man1/"
  WITH_DOCS=0 DESTDIR="$pkgdir" make install
}

# vim:set ts=2 sw=2 et:
