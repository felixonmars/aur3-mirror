# Maintainer: Andre "Osku" Schmidt <andre.osku.schmidt@gmail.com>

_pkgname=accountmanagerplugin
pkgname=trac-$_pkgname
pkgver=0.11
pkgrel=1
pkgdesc="Extendable account manager plugin for Trac"
arch=('any')
url="http://trac-hacks.org/wiki/AccountManagerPlugin"
license=('BSD')
depends=('trac' 'python2')
makedpends=('python2-distribute')
source=($pkgname-$pkgver.zip::'http://trac-hacks.org/changeset/latest/accountmanagerplugin/0.11?old_path=/&filename=accountmanagerplugin/0.11&format=zip')
md5sums=('90e2eb23861a9dc2c20c518c46c759b3')

build() {
  cd "$srcdir/$_pkgname/$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname/$pkgver"
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
