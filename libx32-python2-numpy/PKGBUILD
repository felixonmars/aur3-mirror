# $Id: PKGBUILD 168824 2012-10-16 10:01:22Z allan $
# Upstream Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Maintainer: Fantix King <fantix.king at gmail.com>

pkgbase=libx32-python-numpy
#pkgname=('python2-numpy' 'python-numpy')
pkgname=libx32-python2-numpy
pkgver=1.7.0
_pkgver=1.7.0b2
pkgrel=1.1
pkgdesc="Scientific tools for Python (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://numpy.scipy.org/"
#makedepends=('lapack' 'python' 'python2' 'python-distribute' 'python2-distribute' 'gcc-fortran' 'python-nose')
makedepends=('libx32-lapack' 'binx32-python2' 'libx32-python2-distribute' 'gcc-fortran-multilib-x32' 'gcc-multilib-x32')
source=(http://downloads.sourceforge.net/numpy/numpy-${_pkgver}.tar.gz x32.patch)
md5sums=('1b62cf0e34e2db58b0241b00d603df24'
         '1e66ea556c6f576fad562381879dfa9f')

build() {
  cd "${srcdir}"
  cp -a numpy-${_pkgver} numpy-py2-${_pkgver}

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd "${srcdir}/numpy-py2-${_pkgver}"
  patch -p1 -i ${srcdir}/x32.patch
  printf "[DEFAULT]\nlibrary_dirs = /usr/libx32" > site.cfg
  python2-x32 setup.py config_fc --fcompiler=gnu95 --f90exec='/usr/bin/gfortran -mx32' build

  #echo "Building Python3"
  #cd "${srcdir}/numpy-${_pkgver}"
  #python setup.py config_fc --fcompiler=gnu95 build
}

package_libx32-python2-numpy() {
  _pkgbase=python2-numpy
  depends=('libx32-lapack' 'binx32-python2' "${_pkgbase}=${pkgver}")
  optdepends=('python-nose: testsuite')

  cd "${srcdir}/numpy-py2-${_pkgver}"
  python2-x32 setup.py config_fc --fcompiler=gnu95 --f90exec='/usr/bin/gfortran -mx32' install --prefix=/usr --root="${pkgdir}" --optimize=1

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2-x32|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2-x32|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2-x32|" \
             $(find ${pkgdir} -name '*.py')
}

package_python-numpy() {
  depends=('lapack' 'python')
  provides=("python3-numpy=${pkgver}")
  replaces=('python3-numpy')
  conflicts=('python3-numpy')

  cd "${srcdir}/numpy-${_pkgver}"
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python3-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python3-numpy/"
}
