# Maintainer: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=python2-eventlib
pkgver=0.2.1
pkgrel=1
pkgdesc="Coroutine-based networking library"
arch=('any')
url="http://www.icanblink.com"
license=('custom:MIT')
depends=('python2-greenlet' 'python2-pyopenssl')
source=("http://download.ag-projects.com/SipClient/${pkgname/2}-$pkgver.tar.gz")
sha256sums=('25224794420f430946fe46932718b521a6264903fe8c0ed3563dfdb844c623e7')

build() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # python2 fix
  sed -i "s|bin/python|&2|" `grep -rl bin/python "$pkgdir"`

  # license
  install -Dm644 debian/copyright \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
