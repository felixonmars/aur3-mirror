# Maintainer: perlawk

pkgname=python-nose-parameterized
srcname=nose-parameterized
pkgver=0.3.3
pkgrel=1
pkgdesc="nose-parameterized is a decorator for parameterized testing with nose"
url="https://github.com/wolever/nose-parameterized"
arch=('x86_64' 'i686')
license=('BSD')
depends=('python' 'python-nose')
install=
source=("https://pypi.python.org/packages/source/n/nose-parameterized/nose-parameterized-0.3.3.tar.gz")

package() {
  cd "$srcdir/$srcname-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}
md5sums=('2626983909b70543d7239bb17ec0d384')
