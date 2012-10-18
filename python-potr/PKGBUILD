# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: D6777412 - Fingerprint: C972 8B50 9411 BBE1 5CA5  9906 5103 71F3 D677 7412

pkgname=python-potr
pkgver=1.0.0beta6
pkgrel=2
pkgdesc="This is a pure Python OTR implementation; it does not bind to libotr."
arch=(any)
url="https://github.com/afflux/pure-python-otr"
license=('LGPL')
depends=('python2' 'python2-crypto')
conflicts=('python-potr-git')
options=(!emptydirs)
source=("https://github.com/afflux/pure-python-otr/tarball/${pkgver}")

PYTHON=`which python2`

build() {
  cd $srcdir/afflux*
  set_python2
  $PYTHON ./setup.py build
}

package() {
  cd $srcdir/afflux*
  $PYTHON ./setup.py install --root=$pkgdir/
}

# To use python2 instead of default python v3.
set_python2() {
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "${file}"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "${file}"
  done
}


# vim:set ts=2 sw=2 et:
sha512sums=('323ad31e782409b7bd93539dfc0088de8b114075b88de81123b732aff609fbb2a2c06221c52266225ce54e20e9856b25759bae84c93244a1258ccba3825c8b1c')
