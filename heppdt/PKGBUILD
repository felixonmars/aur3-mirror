#COntributor: T.Cunly

pkgname=heppdt
pkgver=3.04.01
pkgrel=1
pkgdesc="HepPDT contains the fixed data about each particle type. In other words, it contains the data that can be found in the Review of Particle Properties. " 
license=(GPL)
arch=('i686' 'x86_64')
url="https://savannah.cern.ch/projects/heppdt"
depends=(clhep)

source=(http://lcgapp.cern.ch/project/simu/HepPDT/download/HepPDT-${pkgver}.tar.gz)
install=(heppdt.install)
md5sums=(a8e93c7603d844266b62d6f189f0ac7e)

build() {
    cd $srcdir/HepPDT-${pkgver}
    ./configure --prefix=/usr/local  --libdir=/usr/local/lib/HepPDT 
    make  || return 1
    make DESTDIR=$pkgdir/ install
}
