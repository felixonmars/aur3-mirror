# Maintainer: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>

pkgname=python2-tox
pkgver=1.7.2
pkgrel=2
pkgdesc='Python virtualenv management and testing tool'
arch=('any')
url='http://testrun.org/tox/latest/'
license=('GPL2')
depends=('python2-py' 'python2-virtualenv')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/t/tox/tox-${pkgver}.tar.gz")


build() {
    cd "$srcdir/tox-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/tox-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "${pkgdir}/usr/bin/tox" "${pkgdir}/usr/bin/tox2"
    mv "${pkgdir}/usr/bin/tox-quickstart" "${pkgdir}/usr/bin/tox2-quickstart"
}
sha256sums=('267fc86871ae2a398d3e7b4b03e8113b3305533c72ef8de616cbc7258039f1f8')
