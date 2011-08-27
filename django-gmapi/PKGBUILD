# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=django-gmapi
pkgver=1.0.1
pkgrel=1
pkgdesc="Django Google Maps API v3 and Static Maps API helper app."
arch=('any')
url="http://code.google.com/p/django-gmapi/"
license=('MIT')
depends=('python2' 'django')
source=("http://django-gmapi.googlecode.com/files/django-gmapi-${pkgver}.zip")
md5sums=('6cf4df614d612afe483082087b9782c4')

build() {
  cd ${pkgname}

  python2 setup.py build
}

package() {
  cd ${pkgname}

  python2 setup.py install --root=${pkgdir} --optimize=1
}
