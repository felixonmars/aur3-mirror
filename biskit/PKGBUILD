# Mantainer: Mauro Fruet <maurofruet@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Yerko Escalona < yescalona at ug dot uchile dot cl>

pkgname=biskit
pkgver=2.4.0
pkgrel=1
pkgdesc='A Python platform for structural bioinformatics.'
arch=('i686' 'x86_64')
url='http://biskit.pasteur.fr/'
license=('GPL3')
depends=('python2' 'python-numpy' 'netcdf' 'python2-scientificpython'
         'plotutils' 'python2-biggles' 'gnuplot' 'python2-scipy'
         'python2-egenix-mx-base' 'python2-biopython')
source=("http://downloads.sourceforge.net/project/biskit/biskit/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('04f28c7b24fbbacb2be520e845c7af7f')

build() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" --prefix=/usr
}
