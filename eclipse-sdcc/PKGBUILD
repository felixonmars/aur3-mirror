# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=eclipse-sdcc
pkgver=1.0.0
pkgrel=1
pkgdesc="Eclipse plugin for SDCC"
url="http://sourceforge.net/projects/eclipse-sdcc/"
license=('CPL') 
arch=('any')
depends=('eclipse-cdt' 'sdcc')
source=("${pkgname}-${pkgver}.tar.gz::http://switch.dl.sourceforge.net/project/eclipse-sdcc/Eclipse%203.1.x/eclipseSDCC-1.0.0/net.sourceforge.eclipsesdcc-${pkgver}-linux.gtk.x86_64.tar.gz")
md5sums=('1923f842997217d2da1686c6e7e7494e')

package() {
  cd "${srcdir}/net.sourceforge.eclipsesdcc-${pkgver}-linux.gtk.x86_64"
  install -d -m755 "${pkgdir}/usr/share/eclipse"
  cp -R features plugins "${pkgdir}/usr/share/eclipse"
}
