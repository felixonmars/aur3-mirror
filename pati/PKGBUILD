# Contributor: Samed Beyribey <ras0ir AT eventualis dot org>
pkgname=pati
pkgver=0.1.3
pkgrel=1
pkgdesc="A small, simple and intuitive TODO list manager"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pati"
license=('GPL')
depends=('pygtk')
makedepends=('python')
source=(http://pati.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('5399aec7882b24a7ab2ec5db089e3e91')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
