# Maintainer: Pierre Bourdon <delroth@gmail.com>

pkgname=python-ping
pkgver=0.2
pkgrel=1
pkgdesc="An implementation of ICMP ping in Python"
arch=(i686 x86_64)
url="http://bitbucket.org/delroth/python-ping/"
license="GPL2"
depends=(python2)
source=(http://bitbucket.org/delroth/python-ping/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('57228e54268390ca2fef5181d5568e38')

build() {
     cd $srcdir/python-ping-$pkgver
     python2 setup.py install --optimize=1 --root=$pkgdir
}
