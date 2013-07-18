# Maintainer: gandro <gandro@gmx.net>
pkgname=netctl-auto-cli
pkgver=0.2.2
pkgrel=1
pkgdesc="Command line interface for the netctl-auto service."
url="https://github.com/gandro/netctl-auto-cli"
arch=('any')
license=('MIT')
depends=('netctl' 'wpa_supplicant')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://github.com/gandro/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('aa63ecaac59882ea4f4ad16702e71763')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 nacli "${pkgdir}/usr/bin/nacli"
}
