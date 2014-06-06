# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-manager
pkgver=3.0.0
pkgrel=1
pkgdesc="Manager for OpenSAND emulation testbed"
arch=('any')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand')
depends=('python2' 'python2-dbus' 'python2-lxml' 'python2-matplotlib' 'pygtk')
source=("https://launchpad.net/opensand/3.0.x/${pkgver}/+download/opensand-${pkgver}.tar.gz"
        "opensand-manager.patch")
md5sums=('1e62f66c17397f778d58f79fb42b2564'
         '54c3b392a5cc54dd955187aa63c4b756')

prepare() {
  cd "$srcdir/opensand-$pkgver"
  tar xf $pkgname-$pkgver.tar.gz
  cd "$pkgname-$pkgver"
  patch -p1 < $srcdir/opensand-manager.patch
}

build() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  python2 setup.py test
}

package() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
