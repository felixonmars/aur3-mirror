# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname='python2-pystacia'
pkgver=0.1
pkgrel=3
pkgdesc="Python raster imaging library"
arch=('any')
url="http://liquibits.bitbucket.org/"
license=('custom:MIT')
source=("http://pypi.python.org/packages/source/p/pystacia/pystacia-${pkgver}.tar.gz")
makedepends=('python2')
depends=('python2' 'imagemagick' 'python2-decorator' 'python2-six')
md5sums=('d55314173348445e0ffd87cafc3a2327')


package() {
  cd "$srcdir/pystacia-$pkgver"
  PYSTACIA_SKIP_BINARIES=1 python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
