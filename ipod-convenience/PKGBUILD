# Maintainer: Robert Hamilton <rghamilton3 at gmail dot com>
# Contributor: Gabriel Martinez <reitaka at gmail dot com>


pkgname=ipod-convenience
pkgver=0.9
pkgrel=1
pkgdesc="Set of scripts for increasing the usability of an iPhone or iPod Touch"
arch=(i686 x86_64)
url="https://launchpad.net/ipod-convenience"
license=('GPL2')
depends=(fuse sshfs)
makedepends=()
backup=('etc/default/ipod-convenience')
install=ipod-convenience.install
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('d5527ecfb900b6b2131a4102f0a77868')

package() {
  cd ${srcdir}/${pkgname}/

  mkdir -p ${pkgdir}/usr/share/man/man1/
  cp *.1 ${pkgdir}/usr/share/man/man1/
  cp -r etc/ ${pkgdir}/
  cp -a usr/ ${pkgdir}/
  
}
