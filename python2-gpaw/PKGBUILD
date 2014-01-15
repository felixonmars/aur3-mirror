#Maintainer: Pietro Bonfa' <bonfus ( at ) gmail.com>

pkgname=python2-gpaw
pkgver=0.9.0
pkgrel=1
pkgdesc="GPAW is a density-functional theory (DFT) Python code based on the projector-augmented wave (PAW) method and the atomic simulation environment (ASE)."
arch=(any)
url="https://wiki.fysik.dtu.dk/ase/"
license=('LGPL2.1+')
depends=('python2' 'python2-numpy' 'python2-ase>=3.6.0')
optdepends=('python2-matplotlib' 'pygtk' 'libpng' 'python2-scipy')
makedepends=()
options=(!emptydirs)
source=(https://wiki.fysik.dtu.dk/gpaw-files/gpaw-$pkgver.8965.tar.gz)
md5sums=('a48092797ced801cd4285fdb266d355f')


package() {
  cd "$srcdir/gpaw-$pkgver.8965"
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
