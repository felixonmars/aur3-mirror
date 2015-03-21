# Maintainer: Kniyl <mathias.ettinger@gmail.com>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgname=python2-future
pkgver=0.14.3
pkgrel=1
pkgdesc="Clean single-source support for Python 3 and 2"
url="https://github.com/PythonCharmers/python-future"
arch=('any')
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/source/f/future/future-$pkgver.tar.gz")
md5sums=('e94079b0bd1fc054929e8769fc0f6083')
sha256sums=('62857d51881d97dd5492b9295b9f51d92108a52a4c88e2c40054c1d3e5995be9')

build() {
  cd $srcdir/future-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/future-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.txt \
	"$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
