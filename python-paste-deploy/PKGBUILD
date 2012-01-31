# Maintainer: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=python-paste-deploy
pkgver=1.5.0
pkgrel=1
pkgdesc="Load, configure, and compose WSGI applications and servers"
arch=('any')
url="http://pythonpaste.org/deploy/"
license=('custom')
depends=('python2')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/P/PasteDeploy/PasteDeploy-${pkgver}.tar.gz)

md5sums=('f1a068a0b680493b6eaff3dd7690690f')

build() {
  cd $srcdir/PasteDeploy-${pkgver}
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 docs/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
	 -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $pkgdir -name '*.py')
}
