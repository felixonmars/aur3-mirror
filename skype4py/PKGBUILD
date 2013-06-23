# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Peter A. Shevtsov <pshevtsov at severusweb dot ru>
# Contributor: Renzo Carbonara <gnuk0001 at gmail>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Cilyan Olowen
# Contributor: Stanislav Karchebny <berkus+arch@madfire.net>

pkgname=skype4py
pkgver=1.0.35
pkgrel=1
pkgdesc="Python wrapper for the Skype API"
arch=('any')
url="https://github.com/awahlig/skype4py"
license=('BSD')
depends=('python2-dbus' 'python2-gobject2' 'skype')
makedepends=('python2-distribute')
source=($pkgname-$pkgver.tgz::https://github.com/awahlig/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('47b61664a47d29f3d5d4a3d6f01a7c5c13c1610767b6ed9e48c07439003533b8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
