# Maintainer: Byron Clark <byron@theclarkfamily.name>
pkgname=udiskie
pkgver=0.4.0
pkgrel=1
pkgdesc="Removable disk automounter using udisks"
arch=('any')
url="http://www.bitbucket.org/byronclark/udiskie"
license=('MIT')
depends=('udisks' 'dbus-python' 'python2' 'pygobject' 'python-notify')
makedepends=('asciidoc')
optdepends=('consolekit: easier permissions for udisks')
options=(!emptydirs)
source=(http://bitbucket.org/byronclark/udiskie/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('2835741480cdc65ba9e53ee8221b9342')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1

  make -C doc
  install -m 0644 -D doc/udiskie.8 $pkgdir/usr/share/man/man8/udiskie.8
}

# vim:set ts=2 sw=2 et:
