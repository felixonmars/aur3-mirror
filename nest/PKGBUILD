# Maintainer: trex279 <gmail.com: trex279>
# Contributor: Benjamin Wild <b.w@fu-berlin.de>
pkgname=nest
pkgver=2.6.0
pkgrel=1
pkgdesc="Simulator for spiking neural network models that focuses on the dynamics, size and structure of neural systems rather than on the exact morphology of individual neurons."
arch=('i686' 'x86_64')
url="http://www.nest-initiative.org"
license=('GPL')
groups=()
depends=(gsl openmpi python)
makedepends=()
optdepends=()
provides=(nest)
conflicts=(nest)
replaces=(nest)
backup=()
options=('!strip')
install=
changelog=
source=(http://www.nest-simulator.org/download/gplreleases/nest-$pkgver.tar.gz)
noextract=()

build() {
  cd "$srcdir/nest-$pkgver"

  ./configure --prefix=/usr --with-python=/usr/bin/python3 --with-gsl --with-mpi
  make
}

package() {
  cd "$srcdir/nest-$pkgver"

  make DESTDIR="$pkgdir/" install
}

md5sums=('ca7023c3a0ecb914ed2467d5d29265b0')
