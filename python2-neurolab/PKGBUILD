# Maintainer: Oliver Mader <b52@reaktor42.de>
pkgname=python2-neurolab
pkgver=0.2.3
pkgrel=1
pkgdesc="Simple and powerfull neural network library for python"
arch=('any')
url="http://pypi.python.org/pypi/neurolab"
license=('LGPL3')
groups=()
depends=('python2-numpy')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/n/neurolab/neurolab-${pkgver}.tar.gz")
md5sums=('3f17a900e456862c6743de6a2c451624')

package() {
  cd "$srcdir/neurolab-$pkgver"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
