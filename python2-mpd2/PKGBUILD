pkgname='python2-mpd2'
pkgver=0.5.3
pkgrel=1
pkgdesc="Python MPD client library"
arch=('any')
url="http://pypi.python.org/pypi/python-mpd2"
license=('GPL3')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python2-mpd')
source=("https://pypi.python.org/packages/source/p/python-mpd2/python-mpd2-${pkgver}.tar.gz")
md5sums=('df70d4d7e892a34527cc9d120f0cb05d')

package() {
  cd "${srcdir}/python-mpd2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
