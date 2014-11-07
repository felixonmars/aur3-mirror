# Maintainer: Cédric Picard <cpicard@openmailbox.org>

pkgname=bm
pkgver=1.4.2
pkgrel=1
pkgdesc="Simple command line browser independant bookmark and tagging utility"
arch=(any)
url="https://github.com/cym13/bookmark"
license=('GPL')
depends=('python>=3'
         'python-docopt'
         'python-msgpack'
         'python-requests')
source=(https://pypi.python.org/packages/source/b/bm/bm-${pkgver}.tar.gz)
md5sums=('dcede63d2dbabaa86252263d6d22ca78')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
