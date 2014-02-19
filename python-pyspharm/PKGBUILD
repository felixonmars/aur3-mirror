pkgname=python-pyspharm
pkgver=1.0.8
pkgrel=1
pkgdesc='Python spherical harmonic transform module.'
depends=('python-numpy')
arch=('i686' 'x86_64')
url='https://code.google.com/p/pyspharm/'
license=('BSD')
makedepends=('gcc-fortran')
source=(https://pyspharm.googlecode.com/files/pyspharm-1.0.8.tar.gz
        https://www2.cisl.ucar.edu/sites/default/files/spherepack3.2.tar)
md5sums=('7b3a33dd3cbeaa4b8bf67ed5bd210931'
         '283627744f36253b4260efd7dfb7c762')
options=('!buildflags')

prepare() {
   cd "${srcdir}"/spherepack3.2/src
   cp gaqd.f shses.f shaes.f vhaes.f vhses.f shsgs.f shags.f vhags.f \
      vhsgs.f sphcom.f hrfft.f shaec.f shagc.f shsec.f shsgc.f vhaec.f \
      vhagc.f vhsec.f vhsgc.f ihgeod.f alf.f "${srcdir}"/pyspharm-${pkgver}/src
}

build() {
   cd "${srcdir}"/pyspharm-${pkgver}
   python setup.py build
}

package() {
   cd "${srcdir}"/pyspharm-${pkgver}
   python setup.py install --root "${pkgdir}" --skip-build --optimize=1
}
