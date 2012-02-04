# Maintainer: lilydjwg <lilydjwg@gmail.com>

pkgname=python3-urwid
pkgver=1.0.1
pkgrel=1
pkgdesc="Urwid is a curses-based user interface library."
license=('GPL')
arch=('i686' 'x86_64')
depends=('python>=3.2')
makedepends=('python-distribute')
url="http://excess.org/urwid/"
source=(http://excess.org/urwid/urwid-$pkgver.tar.gz)
md5sums=('828f7144b94920205e755c249d2e297f')

build() {
  cd $startdir/src/urwid-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
