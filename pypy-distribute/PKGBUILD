# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sebastien Binet <binet@farnsworth>
# Contributor: Zack Buhman <zack@buhman.org>
# Maintainer: Krzysztof Malinowski <boromil@gmail.com>

pkgbase=pypy-distribute
pkgname=('pypy-distribute')
pkgver=0.6.36
pkgrel=1
pkgdesc="Easily build and distribute Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/distribute"
makedepends=('pypy')
source=(http://pypi.python.org/packages/source/d/distribute/distribute-${pkgver}.tar.gz)
sha1sums=('ab69711e4ea85c84d6710ecadf1d77427539f702')
build() {
   cd "${srcdir}/distribute-${pkgver}"

   # Build pypy module

   sed -i -e "s|^#\!.*/usr/bin/python|#!/usr/bin/pypy|" setuptools/tests/test_resources.py

   pypy setup.py build
}

package_pypy-distribute() {
   depends=('pypy>=1.9')

   cd "${srcdir}/distribute-${pkgver}"
   pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1 --skip-build
}
