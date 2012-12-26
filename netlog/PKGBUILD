# Maintainer: lemanyk <lemanyk@gmail.com>
pkgname=netlog
pkgver=0.5.5
pkgrel=1
pkgdesc='logging stream server written on gevent'
arch=(any)
url='https://github.com/lemanyk/netlog'
license=('MIT')
depends=('python2' 'python2-gevent')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/n/netlog/netlog-$pkgver.tar.gz)
md5sums=('1fd384771ecf17259c1f9100128b25b2') #generate with 'makepkg -g'

build() {
  cd "$srcdir/netlog-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
