# $Id$
# Maintainer: Fabio Lima <fheday@gmail.com>

pkgbase=python-numpy
pkgname=('acml-python2-numpy')
pkgver=1.6.1
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
makedepends=( 'python' 'python2' 'python-distribute' 'python2-distribute' 'gcc-fortran' 'python-nose')
conflicts=('python2-numpy')
source=(
   http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz
   'site.cfg'
)

md5sums=('2bce18c08fc4fce461656f0f4dd9103e'
         '1b60b9fa738d7c2c96c6196daff1313f')


build() {
  cd "${srcdir}"
  cp -a numpy-${pkgver} numpy-py2-${pkgver}
  cp ../site.cfg numpy-py2-${pkgver}/

#  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd "${srcdir}/numpy-py2-${pkgver}"
  python2 setup.py config_fc --fcompiler=gnu95 build

#  echo "Building Python3"
#  cd "${srcdir}/numpy-${pkgver}"
#  python setup.py config_fc --fcompiler=gnu95 build
}

package_python2-numpy() {
  depends=('python2')
  optdepends=('python-nose: testsuite')

  cd "${srcdir}/numpy-py2-${pkgver}"
  /bin/cp ../../site.cfg .

  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${pkgdir} -name '*.py')
}

#package_python-numpy() {
#  depends=('python')
#  provides=("python3-numpy=${pkgver}")
#  replaces=('python3-numpy')
#  conflicts=('python3-numpy')

#  cd "${srcdir}/numpy-${pkgver}"
#  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

#  install -m755 -d "${pkgdir}/usr/share/licenses/python3-numpy"
#  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python3-numpy/"
#}
