# Maintainer: Rich Lindsley <rich at dranek dot com>
pkgname=python2-fftw
_py_pkgname=pyFFTW # The pypi package name
pkgver=0.9.2
pkgrel=2
pkgdesc="A pythonic wrapper around FFTW"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pyFFTW/"
license=('GPL3')
depends=('python2-numpy' 'fftw')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/$_py_pkgname/$_py_pkgname-$pkgver.tar.gz)
md5sums=('34fcbc68afb8ebe5f040a02a8d20d565')
sha1sums=('f8ef40d54b3e6a7322cb824f222f9f47130d2284')
sha256sums=('f6bbb6afa93085409ab24885a1a3cdb8909f095a142f4d49e346f2bd1b789074')

build() {
  cd "$srcdir/$_py_pkgname-$pkgver"

  # Enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${srcdir} -name '*.py')
}

package() {
  cd "$srcdir/$_py_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
