# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=django-appconf
pkgver=0.6
pkgrel=1
pkgdesc="A helper class for handling configuration defaults of packaged Django
apps gracefully"
arch=('any')
url="http://django-appconf.readthedocs.org/en/latest/"
license=('BSD')
depends=('python2-django')
makedepends=()
provides=()
source=("https://pypi.python.org/packages/source/d/django-appconf/django-appconf-0.6.tar.gz")
md5sums=("40494042c3c8bd1e054c884e5ed4bb6c")

package() {
  cd $srcdir/django-appconf-$pkgver
  python2 setup.py install --root=$pkgdir/
}
