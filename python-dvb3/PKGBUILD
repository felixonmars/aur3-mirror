# Contributor: William Rea <sillywilly@gmail.com>
pkgname=python-dvb3
pkgver=0.0.4
pkgrel=1
pkgdesc="Python bindings for the Linux DVB v3 API"
url="http://kamaelia.sourceforge.net"
license="BSD"
depends=('python')
makedepends=('pyrex')
source=(http://dl.sourceforge.net/kamaelia/$pkgname-$pkgver.tar.gz)
md5sums=('7e76ead04325b0db156c44458a50246b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg
}
