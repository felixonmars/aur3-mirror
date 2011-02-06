# Contributor: Markus Pargmann <scosu@gmx.de>
pkgname=corewar-pmars
pkgver=0.9.2
pkgrel=1
pkgdesc="This is the pmars environment to run redcode from corewar."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/corewar/"
license=('GPL2')
groups=()
depends=()
makedepends=('gcc' 'make')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://surfnet.dl.sourceforge.net/sourceforge/corewar/pmars-$pkgver.tar.gz)
noextract=()
md5sums=('a73943a34e9de8f0d3028fc4566cd558') #generate with 'makepkg -g'

build() {
  cd "$srcdir/pmars-$pkgver/src"
  make clean || return 1
  make || return 1
  mkdir -p $pkgdir/usr/bin/
  cp pmars $pkgdir/usr/bin/
}
