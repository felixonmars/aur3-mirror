# Maintainer: Felix Rubio <felixrubiodalmau@gmail.com>
pkgname=python-numpy-atlas
pkgver=1.8.1
pkgrel=1
pkgdesc="Scientific tools for Python (built against ATLAS)"
arch=('i686' 'x86_64')
depends=('atlas-lapack' 'python')
provides=("python-numpy=${pkgver}" "python3-numpy=${pkgver}")
conflicts=('python-numpy' 'python3-numpy')
replaces=('python3-numpy')
license=('custom')
url="http://numpy.scipy.org/"
makedepends=('atlas-lapack' 'python' 'python-distribute' 'gcc-fortran' 'python-nose')
source=(http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz)
md5sums=('be95babe263bfa3428363d6db5b64678')

build() {
  cd "${srcdir}"

  export LDFLAGS="$LDFLAGS -shared"

  cd "${srcdir}/numpy-${pkgver}"
  python setup.py config_fc --fcompiler=gnu95 build
}

package() {
  cd "${srcdir}/numpy-${pkgver}"
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python3-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python3-numpy/"
}
