# Maintainer : Danny Navarro <j@dannynavarro.net>

pkgname=python-hghooks
pkgver=0.6.0
pkgrel=1
arch=('any')
license=('LGPL3')
pkgdesc="A set of useful hooks for Mercurial"
url="http://pypi.python.org/pypi/hghooks/"
depends=('python2')
optdepends=('pep8: Add pep8 support'
            'python2-pyflakes: Add pyflakes support')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/h/hghooks/hghooks-${pkgver}.tar.gz")

package() {
    cd ${srcdir}/hghooks-${pkgver}
    python2 setup.py install --root=${pkgdir} --optimize=1
}
md5sums=('0e903dc90e06b290f1553f84d56c9f58')
