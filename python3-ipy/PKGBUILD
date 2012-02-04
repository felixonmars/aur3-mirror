# Maintainer: mathieui <mathieui(AT)mathieui(DOT)net>
# Contributor: Celos <celos94(AT)gmail(DOT)com>

pkgname=python3-ipy
pkgver=0.75
pkgrel=1
pkgdesc="Python class and tools for handling of IPv4 and IPv6 addresses and networks."
arch=('any')
url="https://github.com/haypo/python-ipy/"
license=('BSD')
depends=('python')
source=(http://cheeseshop.python.org/packages/source/I/IPy/IPy-$pkgver.tar.gz)
md5sums=('d56716a3d8c77fe8539b6e90c88010bd')

build() {
  cd "$startdir/src/IPy-$pkgver"
  python setup.py install --prefix=/usr --root=${startdir}/pkg
  install -D -m644 $startdir/src/IPy-$pkgver/COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
