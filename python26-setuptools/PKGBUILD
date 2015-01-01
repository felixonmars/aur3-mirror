# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@gmail.com>

pkgname=python26-setuptools
pkgver=10.0.1
pkgrel=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/setuptools"
depends=('python26')
source=("http://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz")
md5sums=('abaf3b5d654eb525b9ca67c6d4522292')

prepare() {
  cd "${srcdir}"/setuptools-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/python|#!/usr/bin/python2.6|" setuptools/tests/test_resources.py
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env python2.6|" setuptools/command/easy_install.py
}

build() {
  # Build python 2 module
  cd "${srcdir}"/setuptools-${pkgver}
  python2.6 setup.py build
}

package() {
  cd "${srcdir}/setuptools-${pkgver}"
  python2.6 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  rm "${pkgdir}/usr/bin/easy_install"
}
