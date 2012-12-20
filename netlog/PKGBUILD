# Maintainer: lemanyk <lemanyk@gmail.com>
pkgname=netlog
pkgver=0.2
pkgrel=3
pkgdesc='logging stream server written on gevent'
arch=(any)
url='https://github.com/lemanyk/netlog'
license=('MIT')
depends=('python2' 'python2-gevent')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/n/netlog/netlog-$pkgver.tar.gz)
md5sums=('2a6323ad34457e491817b59626c436f5') #generate with 'makepkg -g'

build() {
  cd "$srcdir/netlog-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
