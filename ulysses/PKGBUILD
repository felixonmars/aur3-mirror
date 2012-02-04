# Contributor: KaBuTe <kabute(at)gulo(dot)org>

pkgname=ulysses
pkgver=0.1
pkgrel=1
pkgdesc="Ulysses is a simple tool that allows you to easily audit a network."
arch=('i686' 'x86_64')
url="http://ulysses.gulo.org/"
license=('GPL2')
groups=()
depends=(gcc)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('44e45d24618613b7227acc610a26cb82')


build() {
  cd $srcdir/$pkgname/src
  make 
  make install
}
