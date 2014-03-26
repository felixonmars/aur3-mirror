pkgname=python-pyramid-beaker
pkgver=0.8
pkgrel=1
pkgdesc='Beaker session factory backend for Pyramid'
arch=('any')
url='https://github.com/Pylons/pyramid_beaker'
license=('custom:BSD')
depends=('python' 'python-pyramid' 'python-beaker')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/p/pyramid_beaker/pyramid_beaker-${pkgver}.tar.gz)
md5sums=('22f14be31b06549f80890e2c63a93834')

build() {
  cd $srcdir/pyramid_beaker-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1
}

