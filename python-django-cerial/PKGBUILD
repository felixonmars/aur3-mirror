# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-django-cerial
pkgver=0.0.4
pkgrel=1
pkgdesc='Fields for storing serializable data'
license=('BSD')
arch=('x86_64' 'i686')
url='https://github.com/aino/django-cerial'
makedepends=('python-setuptools' 'python-django')
source=("https://pypi.python.org/packages/source/d/django-cerial/django-cerial-0.0.4.tar.gz")
sha512sums=('25e4234db97083ec96b1a2b880af6b185ffa336d7c139ea756da6303e2b5562e7e88a8e0f5466309001e0abc5dc0743e4cca354009a8838ce2ba5e1ecd31d489')

package() {
  cd "django-cerial-0.0.4"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
