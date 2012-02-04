# Maintainer: Rémy Oudompheng <oudomphe@clipper.ens.fr>
pkgname=polybori
pkgver=0.7.1
pkgrel=1
pkgdesc="Library for polynomials over boolean rings"
arch=('i686' 'x86_64')
url="http://polybori.sourceforge.net/"
license=('GPL')
depends=('python2' 'boost-libs' 'ipython')
# uncomment to use system m4ri library
#depends+=('m4ri')
makedepends=('boost' 'scons') # 'hevea')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-${pkgver}.tar.gz
        custom.py)
md5sums=('75d96d234c53dc40ea05a41975b0d80b'
         '20e5df185f00bf4387d9e23955a970f2')

build() {
  cd "${srcdir}/polybori-${pkgver%.*}"
  cp -f ../custom.py .
 
  export pkgdir
  export PYTHONSITE=/usr/lib/python2.7/site-packages
  scons -j4 prepare-devel PYTHON=python2
}

package() {
  cd "${srcdir}/polybori-${pkgver%.*}"
  scons devel-install PYTHON=python2
  scons install PYTHON=python2

  find ${pkgdir}/usr/include -name '*.h' -exec chmod 644 {} +
  find ${pkgdir}/usr/include -name '*.hh' -exec chmod 644 {} +
}

