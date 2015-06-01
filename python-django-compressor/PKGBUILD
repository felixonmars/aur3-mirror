# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-django-compressor
pkgver=1.4
pkgrel=1
pkgdesc='Compresses linked and inline JavaScript or CSS into single cached files'
license=('MIT')
arch=('x86_64' 'i686')
url='http://django-compressor.readthedocs.org/en/latest/'
makedepends=('python-setuptools python-django')
source=("https://pypi.python.org/packages/source/d/django_compressor/django_compressor-1.4.tar.gz")
sha512sums=('15ca3b871cf98050206f823ce5d473ceb3ce0584ab5c3dcde3ee4ed02b32050b7dfaea056dfbcc2be768aaba8a885ea4dee18d8f9bd259c200bda3b269d423a1')

package() {
  cd "django_compressor-1.4"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
