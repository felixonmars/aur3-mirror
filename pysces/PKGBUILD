# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=pysces
pkgver=0.8.0rc4
pkgrel=1
pkgdesc="Python simulator for Cellular Systems"
arch=('i686' 'x86_64')
depends=('python2-scipy' 'python2-matplotlib')
optdepends=('gnuplot: as an alternative plotting back-end and 3D plots'
            'ipython2: for interactive modelling sessions (highly recommended)'
            'libsbml: for SBML import and export'
            'python2-pysundials: for CVODE and Events support'
            'python2-pysces-metatool: for elementary mode support')
makedepends=('gcc-fortran' 'unzip')
url="http://pysces.sourceforge.net/"
license=('BSD' 'GPL')
replaces=('python2-pysces')
source=("http://sourceforge.net/projects/pysces/files/pysces/pysces-0.7/pysces-$pkgver.zip" "setup.py.patch")
md5sums=('85b76ff80536c303ff8ba2f3992720a3'
         '0a85b753d42fc5ed037f96df8f199b76')

build() {
  cd "$srcdir/pysces-$pkgver"
  patch -p0 < "$srcdir/setup.py.patch"
  python2 setup.py build
}

package() {
  cd "$srcdir/pysces-$pkgver"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}
