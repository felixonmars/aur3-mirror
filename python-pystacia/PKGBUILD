# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname='python-pystacia'
pkgver=0.1
pkgrel=2
pkgdesc="Python raster imaging library"
arch=('any')
url="http://liquibits.bitbucket.org/"
license=('custom:MIT')
source=("http://pypi.python.org/packages/source/p/pystacia/pystacia-${pkgver}.tar.gz")
makedepends=('python')
depends=('python' 'imagemagick' 'python-decorator' 'python-six')
md5sums=('d55314173348445e0ffd87cafc3a2327')


package() {
  cd "$srcdir/pystacia-$pkgver"
  PYSTACIA_SKIP_BINARIES=1 python3 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
