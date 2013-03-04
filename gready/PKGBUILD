# Maintainer: Robert Štětka <robert dot stetka at gmail dot com>
pkgname=gready
pkgver=0.1
pkgrel=2
url="https://github.com/r-st/Gready"
pkgdesc="Google Reader desktop client based on QT"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt4' )
makedepends=('cmake')
source=(https://github.com/r-st/Gready/zipball/v${pkgver}
        ${pkgname}.desktop )
md5sums=('4bb7c55cd23c2ebfcf36d7427b8e46c5'
         '473791c1bf9e59fb477bb14fc4330ed1')

build() {
  cd "${srcdir}/r-st-Gready-8c21fd0"

  cmake . || return 1
  make || return 1

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}


# vim:set ts=2 sw=2 et:
