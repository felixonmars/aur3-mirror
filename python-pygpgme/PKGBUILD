# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>
_name=pygpgme
_py=python
pkgname=$_py-$_name
pkgver=0.3
pkgrel=1
pkgdesc="A Python interface to the gpgme GnuPG library"
url="https://launchpad.net/pygpgme"
arch=(any)
license=('LGPL')
depends=('gpgme')
makedepends=('make')
source=(https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz)
md5sums=('d38355af73f0352cde3d410b25f34fd0')

package() {
  cd "$srcdir/$_name-$pkgver"
  $_py setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
