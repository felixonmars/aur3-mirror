# Maintainer : Dazzy Ding <h#dazzyd.org>

pkgname=python2-shadowsocks
pkgver=1.3.3
pkgrel=1
pkgdesc="A lightweight tunnel proxy which can help you get through firewalls."
arch=('any')
url="http://shadowsocks.org"
license=('MIT')
depends=('python2')
optdepends=("python2-gevent-beta: for better performance"
            "python2-m2crypto: for encryption support")
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/s/shadowsocks/shadowsocks-$pkgver.tar.gz")
sha256sums=("f495740ed10f4dc6ef220e7fb8ca62dd3cab5f3657bd9fad58a2a50f26a47891")

build() {
    cd "$srcdir/shadowsocks-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/shadowsocks-$pkgver"
    python2 setup.py install --root="$pkgdir"
}
