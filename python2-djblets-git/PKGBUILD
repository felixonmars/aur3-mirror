# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Artyom Olshevskiy <siasia@siasia>

pkgname=python2-djblets-git
pkgver=807.72be9ee
pkgrel=1
pkgdesc="Useful utility functions and classes for use with Django"
url="http://github.com/djblets/djblets"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-distribute' 'django-pipeline' 'python2-django')
conflicts=('djblets' 'python2-djblets')
provides=('djblets=0.8' 'python2-djblets=0.8')
source=('git+git://github.com/djblets/djblets' 'env.patch')
md5sums=('SKIP'
         '53b7495129ecb19c128c7440a3b4b456')

pkgver() {
  cd djblets
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd djblets
  patch -p1 < ${srcdir}/env.patch
}

package() {
  cd djblets
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
