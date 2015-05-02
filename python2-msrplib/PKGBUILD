# Maintainer: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=python2-msrplib
pkgver=0.17.0
pkgrel=2
pkgdesc="A python MSRP client library, implements RFC4975 and RFC4976"
license=('custom:MIT')
arch=('any')
url="http://download.ag-projects.com/MSRP"
depends=('python2-application>=1.5.0' 'python2-gnutls' 'python2-zope-interface' 'twisted')
source=("http://download.ag-projects.com/MSRP/${pkgname/2}-$pkgver.tar.gz")
sha256sums=('fe6ee541fbb4380a5708d08f378724dbc93438ff35c0cd0400e31b070fce73c4')

build() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
