# Maintainer: Sebastian Schultz <sebastian2.schultz AT gmail.com>

pkgname=django-picklefield
pkgver=0.3.1
pkgrel=1
pkgdesc="Django picklefield provides implementation of pickled object field."
arch=('any')
url='http://pypi.python.org/pypi/django-picklefield'
license=('BSD')
depends=('python2' 'python2-django' 'python2-six')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/d/django-picklefield/django-picklefield-$pkgver.tar.gz")
options=(!emptydirs)

build() {
  cd ${srcdir}/django-picklefield-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}
md5sums=('69712c8744502f2bf179c7fbed0006ef')
