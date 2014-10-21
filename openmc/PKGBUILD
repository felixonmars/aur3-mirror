# Maintainer: Adam Nelson <nelsonag at umich dot edu>
pkgname=openmc
pkgver=0.6.1
pkgrel=1
pkgdesc="A Monte Carlo particle transport code specializing in nuclear reactor analysis."
arch=('i686' 'x86_64')
url="https://github.com/mit-crpg/openmc"
license=('MIT')
depends=('tk')
makedepends=('cmake gcc-fortran>=4.6')
provides=('openmc')
options=(!strip)
source=('openmc::git+https://github.com/mit-crpg/openmc.git')
md5sums=('SKIP')

build() {
  cd ${srcdir}/openmc/src/
  git checkout tags/v0.6.1
  
  mkdir build
  cd build
  cmake -Doptimize=on -Dopenmp=on ..
  make -j1
}

package() {
  cd ${srcdir}/openmc/src/build
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
