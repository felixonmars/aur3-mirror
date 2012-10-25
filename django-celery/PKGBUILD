# Contributor: Marco Elver <marco.elver AT gmail.com>
# Maintainer: apkawa <apkawa@gmail.com>

pkgname=django-celery
pkgver=3.0.11
pkgrel=1
pkgdesc="Celery Django integration."
arch=('any')
url='http://pypi.python.org/pypi/django-celery'
license=('BSD')
depends=('python2' 'django' 'django-picklefield' 'python-celery')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/d/django-celery/django-celery-$pkgver.tar.gz")
options=(!emptydirs)

build() {
  cd ${srcdir}/django-celery-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}
md5sums=('2861a1074ebb7608de2eab883097781f')
