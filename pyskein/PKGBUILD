# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=pyskein
pkgver=1.0
pkgrel=1
pkgdesc="A module implementing the Skein hash algorithm."
arch=('i686' 'x86_64')
url="http://pythonhosted.org/pyskein/"
license=('GPL3')
depends=('python')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e99c3e87375347dc27dedeef0b383b98')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1
}
