# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-django-pgindex
pkgver=0.8.2
pkgrel=1
pkgdesc='Search for Django and PostgreSQL'
license=('BSD')
arch=('x86_64' 'i686')
url='https://github.com/aino/django-pgindex'
makedepends=('python-setuptools' 'python-django')
source=("https://pypi.python.org/packages/source/d/django-pgindex/django-pgindex-0.8.2.tar.gz")
sha512sums=('5b61a1324efce48967305a6c4b8c5a96df4c223a604c708bc4270742690f8aebc2e34aefc77d87edaae1d9f6b3d27d95f3a27600ebec851568848244b8824520')

package() {
  cd "django-pgindex-0.8.2"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
