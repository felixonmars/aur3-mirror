# Maintainer: aldeano <aldea.diaguita@gmail.com>

pkgname=django-countries
pkgver=2.1.2
pkgrel=1
pkgdesc="A Django application which provides country choices for use with forms, and a country field for models."
arch=("any")
url="https://pypi.python.org/pypi/$pkgname"
license=('MIT')
depends=('python2-django')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('15e19fd70be1e8939f1bffcfe008e878')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
