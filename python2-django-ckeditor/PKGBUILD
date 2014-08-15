#Maintainer: Dominik Kozaczko <aur@kozaczko.info>

pkgname=python2-django-ckeditor
_pkgname=django-ckeditor
pkgver=4.0.2
pkgrel=2
pkgdesc="Django admin CKEditor integration."
arch=(any)
url="https://github.com/dwaiter/django-ckeditor"
license=('BSD')
depends=('python2' 'python2-simplejson' 'python2-pillow')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('1d8066b124f2cab85f14c2266b828fd3')
conflicts=('django-ckeditor-git')
provides=('django-ckeditor')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

