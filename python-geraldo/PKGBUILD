# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-geraldo
pkgver=0.4.17
pkgrel=1
pkgdesc="Reports engine for Python and Django applications"
arch=('any')
url="http://www.geraldoreports.org/"
license=('LGPL')
changelog=ChangeLog
depends=('python2-reportlab')
optdepends=('python2-imaging: Required for imaging manipulate on the canvas.')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/G/Geraldo/Geraldo-$pkgver.tar.gz)
md5sums=('f86922479c2e5dba515c74b7d1578089')


build() {
    cd $srcdir/Geraldo-$pkgver

    python2 setup.py build
}

package(){
    cd $srcdir/Geraldo-$pkgver

    python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}
