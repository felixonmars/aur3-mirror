# Maintainer: archtux <antonio dot arias99999 at gmail.com>

pkgname=getmediumurl
pkgver=0.0a5
pkgrel=3
pkgdesc="Python module to get URLs of downloadable media and their metadata knowing their main URLs on websites using Flash-based players."
arch=('any')
url="http://savannah.nongnu.org/projects/getmediumurl/"
license=('GPL3')
depends=('python2-lxml')
makedepends=('python2-distribute')
source=(http://download.savannah.gnu.org/releases/getmediumurl/GetMediumURL-$pkgver.tar.gz)
md5sums='0d3660e178bd58549d7a5718f8e39de2'

package() {
  cd $srcdir/GetMediumURL-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
