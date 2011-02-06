# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=python-gtkmvc
pkgver=1.2.1
pkgrel=1
pkgdesc="MVC implementation for PyGTK"
arch=('i686' 'x86_64')
url="http://pygtkmvc.sourceforge.net/"
license=('GPL')
depends=('pygtk')
source=(http://downloads.sourceforge.net/pygtkmvc/python-gtkmvc-${pkgver}.tar.gz)
md5sums=('37470e1ae470aa3600903ede566d9397')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  python setup.py install --root=$startdir/pkg
}

# vim:set ts=2 sw=2 et:
