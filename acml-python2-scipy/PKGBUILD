# Maintaner: Fabio Lima <fheday at gmail >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor Dávid Gábor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=('acml-python2-scipy')
pkgver=0.10.1
pkgrel=1
pkgdesc="SciPy linked to ACML libraries"
arch=('i686' 'x86_64')
url="http://www.scipy.org/"
license=('BSD')
makedepends=('gcc-fortran' 'python2-numpy')
checkdepends=( 'python2-nose')
source=("http://downloads.sourceforge.net/scipy/scipy-${pkgver}.tar.gz")
md5sums=('6ad976549e22e04ca93e70cf55b70a22')

build() {
  unset LDFLAGS
  unset FFLAGS
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib/acml/
  # Changing the arithmetic parameter (Thanks to Fabrizio Castellano)
  sed -i "s/\#define\ UNK\ 1/\#define\ IBMPC\ 1/" \
    scipy-${pkgver}/scipy/special/cephes/mconf.h

  # 2 builds
  cp -r scipy-${pkgver} scipy-${pkgver}-py2

  # build for python3
#  cd scipy-${pkgver}
#  python setup.py config_fc --fcompiler=gnu95 build

  # build for python2
  cd scipy-${pkgver}-py2

  for file in $(find . -name '*.py' -print); do
       sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
       sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

#  python2 setup.py config_fc --fcompiler=gnu95 build
#  python2 setup.py config_fc --fcompiler=gnu95 build
   python2 setup.py config_fc --fcompiler=gnu95 build 
}

#check() {
#   cd "${srcdir}/scipy-${pkgver}-py2"
#  cd scipy-${pkgver}
# figure out how to run tests in the source tree easily
#  python -c "from scipy import test; test('full')"

#  cd scipy-${pkgver}-py2
# figure out how to run tests in the source tree easily
#  python2 -c "from scipy import test; test('full')"
#}

package_python-scipy() {
  depends=('python-numpy')
#  provides=('python3-scipy' 'scipy')

#  cd scipy-${pkgver}

 # python setup.py config_fc --fcompiler=gnu95 install \
  #  --prefix=/usr --root=${pkgdir} --optimize=1

#  install -Dm644 LICENSE.txt \
#    "${pkgdir}/usr/share/licenses/python-scipy/LICENSE"
}

package_python2-scipy() {
  depends=('python2-numpy')
  conflicts=('python-scipy<0.9.0')

  cd "${srcdir}/scipy-${pkgver}-py2"

  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python2-scipy/LICENSE"
}

# vim:set ts=2 sw=2 et:
