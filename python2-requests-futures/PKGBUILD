# Maintainer: Jacques de Laval <chucky@wrutschkow.org>

pkgname=python2-requests-futures
_pkgname=requests-futures
pkgver=0.9.4
pkgrel=1
pkgdesc="Asynchronous Python HTTP for Humans."
arch=('any')
url="https://github.com/ross/requests-futures"
license=('Apache 2.0')
depends=('python2' 'python2-requests' 'python2-futures')
source=("http://pypi.python.org/packages/source/r/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('0954b186ebd8d875c46bbfbcb9ea9f13')

package() {
    cd ${srcdir}/$_pkgname-$pkgver
    python2 setup.py install --root ${pkgdir} --optimize=1
}