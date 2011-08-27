# Maintainer: Hector Mtz-Seara <hseara__*a*t*__gmail*.*com>

pkgname=python2-numericalpython
pkgver=23.8.2
pkgrel=1
pkgdesc="This is the NumericalPython release that we recommend for use with ScientificPython."
arch=('i686' 'x86_64')
url="http://dirac.cnrs-orleans.fr/scientificpython/"
license=('GPL')
depends=('python2')
source=(http://dirac.cnrs-orleans.fr/plone/software/scientificpython/Numeric-$pkgver.tar.gz)
md5sums=('cc47430607fe321f26ec3a553bc8fd7c')

build() {
  cd "$srcdir"/Numeric-$pkgver
  python2 setup.py build
}

package() {
    cd "$srcdir"/Numeric-$pkgver
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}

