# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: p2k <patrick.schneider@uni-ulm.de>

pkgname=python-couchdbkit
pkgver=0.6.5
pkgrel=1
pkgdesc="(Use python2-couchdbkit!) A framework to allow python applications to use CouchDB"
arch=('any')
url="http://couchdbkit.org"
license=('CUSTOM')
depends=('python2' 'python2-anyjson' 'python2-restkit')
optdepends=('couchdb: for setting up a local couchdb server'
            "django: for couchdbkit's django extension")
makedepends=('python2-setuptools')
provides=(python2-couchdbkit)
conflicts=(python2-couchdbkit)
source=(http://pypi.python.org/packages/source/c/couchdbkit/couchdbkit-$pkgver.tar.gz)
md5sums=('d5f6382665697b0f126f68a211c1a5a2')

build() { 
    cd "$srcdir/couchdbkit-$pkgver"

    python2 setup.py build
}

package() {
    cd "$srcdir/couchdbkit-$pkgver"

    python2 setup.py install --root="$pkgdir"
    install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

