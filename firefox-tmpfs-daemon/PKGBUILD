# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firefox-tmpfs-daemon
pkgver=0.4
pkgrel=5
pkgdesc="Sync all ~/.mozilla directories to tmpfs at boot and stop time"
arch=(any)
url=https://bbs.archlinux.org/viewtopic.php?id=118576
license=('GPL')
depends=('firefox' 'rsync')
conflicts=('firefox-sync')
source=(  rc.firefox-tmpfs
          confd.firefox-tmpfs )
md5sums=( d9730b3bd69afe1b2e30088900f3bb6e
          fa5d47bc7bfa10b58212aa66c39fd960 )

backup=(etc/conf.d/firefox-tmpfs)

package() {
  install -m 755 -D $srcdir/rc.firefox-tmpfs $pkgdir/etc/rc.d/firefox-tmpfs
  install -m 644 -D $srcdir/confd.firefox-tmpfs $pkgdir/etc/conf.d/firefox-tmpfs
  echo ">> Add firefox-tmpfs to the DAEMONS array in /etc/rc.conf"
  echo ">> DAEMONS=(... @firefox-tmpfs ...)"
  echo ">> Change default configuration in /etc/config/firefox-tmpfs"
}

# vim:set ts=2 sw=2 et:
