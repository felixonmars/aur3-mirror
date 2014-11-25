# Maintainer: Max Meyer <dev@fedux.org>
pkgname=procenv
pkgver=0.36
pkgrel=1
pkgdesc="command-line utility that simply dumps all attributes of its environment"
arch=( i686 x86_64 )
url="https://launchpad.net/procenv"
license=('GPL')
depends=('glibc')
#changelog="src/$pkgname-$pkgver/ChangeLog"
source=(https://launchpad.net/procenv/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
sha256sums=('70550499d0602ffbb4bbbe91c1a6d468d44589ab29b74b5ccc42b9558f970fb4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
