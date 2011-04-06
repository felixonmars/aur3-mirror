# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=python3-pypng
pkgver=0.0.12
pkgrel=1
pkgdesc="Python 3 module to decode and encode PNG files"
arch=('any')
url="http://code.google.com/p/pypng/"
license=('MIT')
depends=('python')
source=("http://pypng.googlecode.com/files/pypng-${pkgver}.tar.gz")
md5sums=('52e59bc0eeb3282e28aab9b00f9805dd')

build() {
  cd pypng-${pkgver}

  # convert to python3
  find -name '*.py' -exec 2to3-3.2 -w -n {} \;

  python setup.py build
}

package() {
  cd pypng-${pkgver}

  python setup.py install --root=${pkgdir} --optimize=1
}
