# Maintainer: Andrew Kopplin <revrollic+aur@gmail.com>

pkgname=vnc2flv
pkgver=20100207
pkgrel=3
pkgdesc="Records VNC session to .FLV movies"
arch=(any)
url="http://www.unixuser.org/~euske/python/vnc2flv/index.html"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/v/vnc2flv/${pkgname}-${pkgver}.tar.gz)
md5sums=('8492e46496e187b49fe5569b5639804e')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ || return 1
}

