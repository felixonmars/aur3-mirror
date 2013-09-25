# Contributor: p2k <patrick.schneider@uni-ulm.de>
# Contributor: christophe gueret <christophe.gueret@gmail.com>
pkgname=python2-couchdbkit
pkgver=0.6.5
pkgrel=1
pkgdesc="A framework to allow python applications to use CouchDB"
arch=('any')
url="http://couchdbkit.org"
license=('CUSTOM')
depends=('python2' 'python2-anyjson' 'python2-restkit')
optdepends=('couchdb: for setting up a local couchdb server'
            "django: for couchdbkit's django extension")
makedepends=('python2-setuptools')
source=(https://github.com/benoitc/couchdbkit/archive/$pkgver.zip)
md5sums=('ce4b31c5cfd0e34b1d32d1e2f82cddde')

build() { 
    cd "$srcdir"/couchdbkit-$pkgver

    python2 setup.py build || return 1
}

package() {
    cd "$srcdir"/couchdbkit-$pkgver

    python2 setup.py install --root=$pkgdir || return 1
    install -m 644 -D LICENSE $pkgdir/usr/share/licenses/python2-couchdbkit/LICENSE
}

