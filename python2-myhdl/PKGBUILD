#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=python2-myhdl
pkgver=0.8.1
pkgrel=2
pkgdesc="MyHDL turns Python into a hardware description and verification language, providing hardware engineers with unprecedented power."
depends=('python2')
arch=('any')
url="http://www.myhdl.org"
provides=('myhdl' 'python-myhdl')
license=('LGPL')
source=("http://sourceforge.net/projects/myhdl/files/myhdl/${pkgver}/myhdl-${pkgver}.tar.gz")
package() {
  PYTHON=python2
  cd "${srcdir}/myhdl-${pkgver}"
  $PYTHON setup.py install --root "${pkgdir}"
}
sha256sums=('250858b6664348511f4bb5d5c972570242f8676f077c2ae44db4571e4670c993')
