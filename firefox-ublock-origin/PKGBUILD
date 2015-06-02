# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=firefox-ublock-origin
pkgver=0.9.8.2
pkgrel=1
pkgdesc="An efficient blocker for Firefox"
url="https://github.com/gorhill/uBlock"
arch=('any')
license=('GPLv3')
groups=('firefox-addons')
depends=("firefox")
makedepends=('unzip')
noextract=("uBlock0.firefox.xpi")
source=("https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock0.firefox.xpi")
sha256sums=('170886e024653888bbfb0279c98b601ab71b93c9443a498f53b31619f1e0c641')

package() {
  cd $srcdir
  unzip uBlock0.firefox.xpi
  local emid="uBlock0@raymondhill.net"
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  [ -n ${emid} ] || return 1
  install -d $dstdir
  cp -R * $dstdir
  rm $dstdir/*.xpi
  find $pkgdir -type d -exec chmod 0755 {} \;
  find $pkgdir -type f -exec chmod 0644 {} \;
}
