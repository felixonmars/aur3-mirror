# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=python-xmppony-hg
pkgver=71
pkgrel=1
pkgdesc="XMPP library written in Python"
arch=('any')
url="http://xmppony.last-exile.org"
license=('GPL3')
depends=('python')
optdepends=('python-dnspython: SRV records support' 'pydns: SRV records support')
makedepends=('setuptools')
provides=(python-xmppony)
conflicts=(python-xmppony)
source=()
md5sums=()

_hgroot='http://hg.last-exile.org'
_hgrepo='xmppony'

build() {
    cd $srcdir/$_hgrepo
    python setup.py install --prefix=/usr --root=$pkgdir
}
