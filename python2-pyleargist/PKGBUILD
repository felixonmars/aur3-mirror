pkgname='python2-pyleargist'
pkgver=2.0.5
pkgrel=1
pkgdesc="Python wrapper for the LEAR GIST image descriptor"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pyleargist"
license=('PSF')
depends=('python2' 'python2-numpy' 'fftw')
makedepends=('python2-distribute' 'cython2')
source=("http://pypi.python.org/packages/source/p/pyleargist/pyleargist-$pkgver.tar.gz")
md5sums=('00b7fa75cf84687db282dd018d0118b3')

package() {
  cd "$srcdir/pyleargist-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
