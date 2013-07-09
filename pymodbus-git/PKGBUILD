# Contributor: trillanewhero 

pkgname=pymodbus-git
_pyname=pymodbus
_gitname=pymodbus
pkgver=1.1.0_35_g85083ea
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python 2.7"
arch=('any')
url="https://code.google.com/p/pymodbus/"
license=('BSD')
depends=('twisted>=12.2.0' 'python2-pyserial>=2.6')
makedepends=('git')
#optdepends=('quality': 'coverage >= 3.5.3' 'nose >= 1.2.1' 'mock >= 1.0.0' 'pep8 >= 1.3.3'
#'documents': 'sphinx >= 1.1.3'
#'twisted': 'pyasn1 >= 0.1.4' 'pycrypto >= 2.6'
#)

source=('git+https://github.com/bashwork/pymodbus.git')
provides=('pymodbus')
conflicts=('pymodbus')
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitname}"
  python2.7 setup.py install --root="${pkgdir}/" --optimize=1
  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's/-/_/g;s/v//'
}

# vim:set ts=2 sw=2 et:
