# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=pmdtools
pkgver=0.50
pkgrel=1
pkgdesc="A post mortem damage likelihood framework tool."
arch=('any')
url="https://code.google.com/p/pmdtools/"
license=('custom')
depends=('python>=2.6')
source=("http://pmdtools.googlecode.com/svn/pmdtools.py" "starter.sh")
md5sums=('b005fe2aa4b5c01926ec4c8536b55138' '2a14de256ab305ce2d99f5d953bd08f4')

package() {
  install -D -m755 "${srcdir}/${pkgname}.py" "${pkgdir}/opt/$pkgname/${pkgname}.py"
  install -D -m755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname/starter.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/starter.sh" "${pkgdir}/usr/bin/${pkgname}"
}

