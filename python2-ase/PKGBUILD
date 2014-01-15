#Maintainer: Pietro Bonfa' <bonfus ( at ) gmail.com>

pkgname=python2-ase
pkgver=3.8.1
pkgrel=1
pkgdesc="ASE is an Atomistic Simulation Environment written in the Python programming language with the aim of setting up, stearing, and analyzing atomistic simulations."
arch=(any)
url="https://wiki.fysik.dtu.dk/ase/"
license=('LGPL2.1+')
depends=('python2' 'python2-numpy')
optdepends=('python2-matplotlib' 'pygtk' 'libpng' 'python2-scipy')
makedepends=()
options=(!emptydirs)
source=(https://wiki.fysik.dtu.dk/ase-files/python-ase-$pkgver.3440.tar.gz)
md5sums=('86fa053caf169bfcdddbe7ac985d9740')


package() {
  cd "$srcdir/python-ase-$pkgver.3440"
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
