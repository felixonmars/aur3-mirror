# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=pynagram
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple word game in which the player is presented with seven letters in a random order."
arch=(any)
url="https://launchpad.net/pynagram"
license=('GPL')
depends=('python2-pyqt' 'python-simplejson')
makedepends=('python2-distribute')
source=("http://launchpad.net/pynagram/1.0/1.0.1/+download/$pkgname-$pkgver.tar.gz"
        "https://launchpadlibrarian.net/30272434/pynagram-logo.png"
        "$pkgname.desktop")
md5sums=('d7957d1ed836c6a1a55f3163ea9c1bd7'
         'e080138f67a2efc19883520421fe6dcd'
         'b83e6a7b27131eb3b613fe74d1ed0e26')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/"

  # desktop
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../$pkgname-logo.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
