# Maintainer: Hugo Doria <hugo@archlinux.org>

pkgname=python-behaviour
pkgver=0.1a4
pkgrel=2
pkgdesc="language suitable for Behaviour Driven Development (BDD)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pytz"
license=("LGPL")
depends=('python')
source=(http://pypi.python.org/packages/source/B/Behaviour/Behaviour-${pkgver}.tar.gz)
md5sums=('b3ea2a873f40f1c95150abb9947cc4e4')

build() {
    cd ${srcdir}/Behaviour-${pkgver}
    python setup.py install --root=${pkgdir}
}
