# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=pgxn-client
pkgver=0.1a3
pkgrel=1
pkgdesc="Command line tool to interact with the PostgreSQL Extension Network"
arch=(any)
url="http://pgxn.org/"
license=('BSD')
depends=('python2')
conflicts=('pgxn.client')
source=(http://pypi.python.org/packages/source/p/pgxn.client/pgxn.client-$pkgver.tar.gz)
md5sums=('36af77f5e511e73f7027f4f0d520f490')

build() {
  cd $srcdir/pgxn.client-$pkgver/
  python2 setup.py install --root=$pkgdir

  install -d -m755 "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/"
}
