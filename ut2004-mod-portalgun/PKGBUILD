# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

pkgname=ut2004-mod-portalgun
pkgver=LATEST
pkgrel=1
pkgdesc="Portal Gun Mod for UT 2004"
arch=(any)
url="http://www.moddb.com/games/unreal-tournament-2004/downloads/portal-gun-mod-for-ut-2004"
license=('unknown')
depends=(ut2004)
makedepends=(unzip)
source=(http://dl.dropbox.com/u/9441929/ut2004/PortalGun3-9-06.zip)
md5sums=('8cb25376ca8330ac79df571da6706e37')

package() {
  mkdir -pv $pkgdir/opt/ut2004/System
  chmod u=rw,g=r,o=r PortalGun.{ini,u,ucl}
  cp -v PortalGun.{ini,u,ucl} $pkgdir/opt/ut2004/System
}

# vim:set ts=2 sw=2 et:
