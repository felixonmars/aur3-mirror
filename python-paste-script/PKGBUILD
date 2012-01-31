# Maintainer: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=python-paste-script
pkgver=1.7.5
pkgrel=1
pkgdesc="A pluggable command-line frontend, including commands to setup package file layouts"
arch=('any')
url="http://pythonpaste.org/script/"
license=('custom')
depends=('python2' 'python-paste>=1.7' 'python-paste-deploy')
optdepends=('python-cheetah: for templating' 'python-flup: utilities for WSGI')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/P/PasteScript/PasteScript-${pkgver}.tar.gz)
md5sums=('4c72d78dcb6bb993f30536842c16af4d')

build() {
  cd $srcdir/PasteScript-${pkgver}
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 docs/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
	 -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $pkgdir -name '*.py')
}
