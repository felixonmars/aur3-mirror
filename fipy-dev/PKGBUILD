# Maintainer: Raymond Smith <raymondbarrettsmith at gmail dot com>
pkgname=fipy-dev
_pkgname=fipy
pkgver=version.3_1.r30.gba45a99
pkgrel=1
pkgdesc="Partial differential equation solver for Python, based on finite volume approach."
arch=('any')
url="http://www.ctcms.nist.gov/fipy"
license=('custom:Public Domain')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib')
makedepends=('python2-distribute' 'python2-ez-setup')
optdepends=('pysparse: improved simulation speed via sparse linear solvers'
            'gmsh: creation of irregular meshes')
provides=('fipy')
conflicts=('fipy')
source=('git://github.com/usnistgov/fipy.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
  
package() {
   cd "${srcdir}/${_pkgname}"
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
   install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" \
     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et tw=0:
