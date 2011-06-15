# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=madde-configurations
pkgver=0.7.59
pkgrel=2
_rpmver=3.2
pkgdesc="MADDE configurations for MeeGo"
arch=('i686' 'x86_64')
url="http://meego.gitorious.org/meego-developer-tools/madde-configurations"
license=('GPL2')
depends=('madde')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('721b9e08cce554432ce4800d828eaf61')

package() {
  cd "$srcdir"
  tar -xf ${pkgname}-${pkgver}.tar.gz

  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/lib/madde/linux-${CARCH}/cache/madde.conf.d
  cp -a madde.conf.d/meego-*.conf "${pkgdir}"/usr/lib/madde/linux-${CARCH}/cache/madde.conf.d
}
