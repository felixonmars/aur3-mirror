# Contributor: Marcel Wysocki <maci@satgnu.net>
# Maintainer: Marcel Wysocki <maci@satgnu.net>

pkgname=quake2world-data-rsync
pkgver=0
pkgrel=4
pkgdesc="Data files for Quake2World. A free, stand-alone, multiplayer-only iteration of Quake2"
arch=('i686' 'x86_64')
url="http://www.quake2world.net"
source=()
md5sums=()
license=('GPL')
depends=('rsync')
makedepends=('rsync')

_rsyncurl=rsync://jdolan.dyndns.org/quake2world


build() {
  cd $startdir/src
  msg "Checking out rsync repository"
  rsync -vrzhP --delete --inplace $_rsyncurl quake2world

  msg "rsync checkout done or server timed out."

  mkdir -p $startdir/pkg/usr/share
  cp -r quake2world $startdir/pkg/usr/share

}
