
pkgname=django-leaflet
pkgver=0.15.0
_pkgver=0.15.0
pkgrel=1
pkgdesc="django-leaflet allows you to use Leaflet in your Django projects."
arch=(any)
url="https://pypi.python.org/pypi/django-leaflet"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/d/django-leaflet/$pkgname-$_pkgver.zip)
md5sums=('f1c43e939da2f89bc77709bcc3cdcfba')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}
