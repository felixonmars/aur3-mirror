# Maintainer: Cédric Picard <cpicard@openmailbox.org>

pkgname=bm
pkgver=1.5.4
pkgrel=1
pkgdesc="Simple command line browser independant bookmark and tagging utility"
arch=(any)
url="https://github.com/cym13/bookmark"
license=('GPL')
depends=('python>=3'
         'python-docopt'
         'python-msgpack'
         'python-requests'
         'python-setuptools')
source="https://pypi.python.org/packages/source/b/bm/$pkgname-${pkgver}.tar.gz"
md5sums=('88f4d21a2bc141c88b052521a6df8fa5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
