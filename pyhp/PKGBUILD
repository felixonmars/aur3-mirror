# Maintainer: James Cleveland <jamescleveland at gmail dot com>

pkgname=pyhp
pkgver=0.2
pkgrel=3
pkgdesc="A simple tool to hit websites at a given interval and display whether they are up or not."
url="https://github.com/radiosilence/pyhp"
depends=('python2' 'python2-requests' 'python2-docopt')
makedepends=('python2-distribute')
license=('BSD')
arch=('any')
source=("http://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-$pkgver.tar.gz")
md5sums=('222ecb62911bde6f74ffd09dd0663063')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"/
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
