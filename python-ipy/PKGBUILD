# Maintainer: mathieui <mathieui(AT)mathieui(DOT)net>
# Contributor: Celos <celos94(AT)gmail(DOT)com>

pkgname=python-ipy
_pkgname=IPy
pkgver=0.81
pkgrel=1
pkgdesc="Python class and tools for handling of IPv4 and IPv6 addresses and networks."
arch=('any')
url="https://github.com/haypo/python-ipy/"
license=('BSD')
depends=('python')
replaces=('python3-ipy')
provides=('python3-ipy')
source=(http://cheeseshop.python.org/packages/source/I/${_pkgname}/${_pkgname}-$pkgver.tar.gz)
md5sums=('7a305c0b60950a9a90c89e9a6f9e06f4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 $srcdir/$_pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
