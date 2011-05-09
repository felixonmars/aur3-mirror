# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firefox-tmpfs-daemon
pkgver=0.3
pkgrel=1
pkgdesc="Sync all ~/.mozilla directories to tmpfs at boot and stop time"
arch=(any)
url=https://bbs.archlinux.org/viewtopic.php?id=118576
license=('GPL')
depends=('firefox' 'rsync')
conflicts=('firefox-sync')
source=(firefox-tmpfs)
md5sums=(d98d1860a6901ef9e9a09cd5d0bf7105)

package() {
  install -D $srcdir/firefox-tmpfs $pkgdir/etc/rc.d/firefox-tmpfs
  echo "Add firefox-tmpfs to the DAEMONS array in /etc/rc.conf"
  echo "DAEMONS=(... @firefox-tmpfs ...)"
}

# vim:set ts=2 sw=2 et:
