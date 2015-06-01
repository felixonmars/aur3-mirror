# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-django-leaflet-storage
pkgver=0.7.6
pkgrel=1
pkgdesc='Create collaborative maps on top of Geodjango and Leaflet'
license=('unknown')
arch=('x86_64' 'i686')
url='https://github.com/yohanboniface/django-leaflet-storage'
makedepends=('python-setuptools' 'python-django')
source=("https://pypi.python.org/packages/source/d/django-leaflet-storage/django-leaflet-storage-${pkgver}.tar.gz")
sha512sums=('eda177f494715f00bb9461557cbad0e7de77fbb508745e8ef02f4d9c78d01856d5875bdf7367d61e25a42d32c6e9efe568836c4902f277270138c214e0a74c0b')

package() {
  cd "django-leaflet-storage-0.7.6"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
