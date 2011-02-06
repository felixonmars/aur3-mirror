# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=python-xmppony
_pkgname=xmppony
pkgver=0.1
pkgrel=2
pkgdesc="XMPP library written in Python"
arch=('i686' 'x86_64')
url="http://xmppony.last-exile.org"
license=('GPL3')
depends=('python')
optdepends=('python-dnspython: SRV records support' 'pydns: SRV records support')
makedepends=('setuptools')
source=("http://xmppony.last-exile.org/sources/$_pkgname-$pkgver.tar.bz2")
md5sums=('8f7349ea63e039e143c7a00c9ea499ea')

build() {
    cd $startdir/src/$_pkgname-$pkgver
    python setup.py install --prefix=/usr --root=$startdir/pkg
}
