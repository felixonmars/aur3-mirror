# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=python2-keyboardleds
_pkgname=python-keyboardleds
pkgver=0.3.1
pkgrel=2
pkgdesc="A library to interact with your keyboard's LEDs (scroll lock, caps lock, num lock)."
arch=('any')
url="http://jwilk.net/software/python-keyboardleds"
license=('MIT')
depends=('python2')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('acd71cfe92c3ce14f25cb554e697802b')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
