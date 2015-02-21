# Maintainer: Andrei Shadrikov <notvuvko@gmail.com>
pkgname=python2-numpy-atlas
pkgver=1.9.1
pkgrel=1
pkgdesc="Scientific tools for Python (built against ATLAS)"
arch=('i686' 'x86_64')
depends=('atlas-lapack' 'python2')
conflicts=('python2-numpy')
provides=("python2-numpy=${pkgver}")
replaces=('python2-numpy')
license=('custom')
url="http://numpy.scipy.org/"
makedepends=('atlas-lapack' 'python2' 'python2-distribute' 'gcc-fortran' 'python2-nose')
source=(http://sourceforge.net/projects/numpy/files/NumPy/${pkgver}/numpy-${pkgver}.tar.gz/download)
md5sums=('78842b73560ec378142665e712ae4ad9')

build() {
  cd "${srcdir}"

  export LDFLAGS="$LDFLAGS -shared"

  cd "${srcdir}/numpy-${pkgver}"
  python2 setup.py config_fc --fcompiler=gnu95 build
}

package() {
  cd "${srcdir}/numpy-${pkgver}"
  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${pkgdir} -name '*.py')
}
