# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=bully-git
pkgver=1.0.22.1fef73a
pkgrel=2
pkgdesc="Brute force attack against WPS, that actually works."
arch=('i686' 'x86_64')
url="https://github.com/bdpurcell/bully"
license=('GPL3')
depends=('libpcap' 'openssl')
makedepends=('git')
conflicts=('bully')
provides=('bully')
source=("$pkgname"::'git://github.com/bdpurcell/bully.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's|^[^0-9]*||;s|[0-9]-g||;s|-|.|g'
}

build() {
  cd "$srcdir/$pkgname/src"
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  install -Dm755 bully "$pkgdir/usr/bin/bully"
}

# vim:set ts=2 sw=2 et:
