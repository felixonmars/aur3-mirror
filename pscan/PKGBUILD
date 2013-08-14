# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=pscan
pkgver=1.3
pkgrel=1
pkgdesc='utility program which attempts to scan C source files for common function abuses, which often lead to buffer overflows'
arch=('x86_64' 'i686')
url='http://deployingradius.com/pscan/'
license=('GPL2')
depends=('glibc')
makedepends=('flex')
source=(${url}/${pkgname}.tar.gz)
md5sums=('07083eade2dbd7a9b394189cb2ee400e')

build() {
  make
}

package() {
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
