# Maintainer: Greg Maslov <maslov@cs.unc.edu>
pkgname=rlglue
pkgver=3.04
pkgrel=1
epoch=
pkgdesc="A standard interface to connect reinforcement learning agents, environments, and experiment programs."
arch=('i686' 'x86_64')
url="http://glue.rl-community.org/"
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://rl-glue-ext.googlecode.com/files/rlglue-$pkgver.tar.gz")
noextract=()
md5sums=('9d53f131aa5d5d90755355d83d739c8f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
