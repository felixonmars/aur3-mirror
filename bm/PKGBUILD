# Maintainer: Cédric Picard <cpicard@openmailbox.org>

pkgname=bm
pkgver=1.6.1
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
source="https://pypi.python.org/packages/source/b/bm/bm-1.6.1.tar.gz"
md5sums=('c8cb61547ecfbe7919bd9f04bc2f9bbe')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
