pkgname=odict
pkgver=1.5.1
pkgrel=1
pkgdesc="Dictionary in which the insertion order of items is preserved (using an internal double linked list). In this implementation replacing an existing item keeps it at its original position."
arch=('i686' 'x86_64')
url="https://github.com/bluedynamics/odict"
license=('Python License 2.0')
depends=('python2')
source=(http://pypi.python.org/packages/source/o/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('77ded25c29035b68574383a08af2bdf1')
build() {
   cd $srcdir/$pkgname-$pkgver
  python setup.py build
}
package() {
   cd $srcdir/$pkgname-$pkgver
  python setup.py build
}