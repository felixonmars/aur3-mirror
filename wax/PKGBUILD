# Contributor: Jo Christian Bergskaas <jcberg@gmail.com>

pkgname=wax
pkgver=0.3.16
pkgrel=1
pkgdesc="Wax is a user-friendly layer on top of wxPython. It allows for easier GUI programming in a more pythonic way."
url="http://zephyrfalcon.org/labs/wax.html"
depends=('wxpython>=2.6.0' 'python')
source=(http://zephyrfalcon.org/download/$pkgname-$pkgver.zip)
md5sums=('a3b6c3871a72bca147533c0c491f2d33')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg
}
# vim: ft=sh ts=2 et
