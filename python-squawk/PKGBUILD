# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-squawk
_pkgname=squawk
pkgver=0.3.1
pkgrel=1
pkgdesc="A python library and command line tool for running SQL queries against structured/semi-structured static files. "
url="http://github.com/samuel/squawk"
license=('BSD')
arch=('any')
depends=('pyparsing')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir

  install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
md5sums=('6e0b83ff0ad2a2c87c3650c513cbe6a8')
sha1sums=('642ad40991e456eff741af318df9c83883ebdd6c')
