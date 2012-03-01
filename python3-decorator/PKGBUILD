# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname='python3-decorator'
pkgver=3.3.2
pkgrel=2
pkgdesc="Better living through Python with decorators"
arch=('any')
url="http://pypi.python.org/pypi/decorator/"
license=('custom:BSD')
makedepends=('python' 'python-distribute')
depends=('python')
source=("http://pypi.python.org/packages/source/d/decorator/decorator-${pkgver}.tar.gz"
        'LICENSE.txt')
md5sums=('446f5165af67eb0fcd8fd28abd259e86'
         '0ca76d2c707f09dbb04acc425ea1a08b')

package() {
  cd "$srcdir/decorator-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf build  # remove 2to3 output so that it is not used below.

  install -D -m644 "${srcdir}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
