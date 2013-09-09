pkgname=django-contact-form
pkgver=1.0
pkgrel=1
pkgdesc="This application provids simple, extensible contact-form functionality for Django sites."
arch=('i686' 'x86_64')
url="https://github.com/bluedynamics/odict"
license=('Python License 2.0')
depends=('django')
source=(http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('878856c5de059bfeebe8788fd298ed0e')
build() {
   cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
   cd $srcdir/$pkgname-$pkgver
  python setup.py build
}