# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Axilleas P <markelos@archlinux.gr>

pkgname=bin32-fennec
pkgver=10.0.2
pkgrel=1
pkgdesc="Webbrowser for mobile devices based on Firefox"
arch=('x86_64')
license=('GPL' 'LGPL' 'MPL')
url="http://www.mozilla.com/en-US/mobile/"
depends=('lib32-alsa-lib' 'lib32-libxt' 'lib32-nss' 'lib32-gtk2')
source=("http://ftp.mozilla.org/pub/mozilla.org/mobile/releases/${pkgver}/linux/en-US/fennec-${pkgver}.en-US.linux-i686.tar.bz2")

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/opt/fennec
  cp -R fennec/* "${pkgdir}"/opt/fennec/

  install -d "${pkgdir}"/usr/bin
  ln -sf /opt/fennec/fennec "${pkgdir}"/usr/bin/fennec
  ln -sf /opt/fennec/fennec "${pkgdir}"/usr/bin/firefox-mobile
}

md5sums=('e0dabba6c617fb8a4470f741ce841e3e')
