pkgname=hepmc
_pkgname=HepMC
pkgver=2.06.09
pkgrel=2
pkgdesc='he HepMC package is an object oriented event record written in C++ for High Energy Physics Monte Carlo Generators.'
url="http://lcgapp.cern.ch/project/simu/HepMC"
arch=('x86_64' 'i686')
license=('GPLv3') 
source=("http://lcgapp.cern.ch/project/simu/HepMC/download/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1030f31ad9d19d8ae184145a693c4a3092131f485e2ed89598b7172992a825ad9aa46fb44a9199a00c4a6bd7e163daead9452e9bc4fe32cb3b97351cf22906c4')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr  --with-momentum=GEV --with-length=CM
  make
}

package() {
  msg 'Creating the package'
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
