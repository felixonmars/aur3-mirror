# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firefox-tmpfs-daemon
pkgver=0.4
pkgrel=1
pkgdesc="Sync all ~/.mozilla directories to tmpfs at boot and stop time"
arch=(any)
url=https://bbs.archlinux.org/viewtopic.php?id=118576
license=('GPL')
depends=('firefox' 'rsync')
conflicts=('firefox-sync')
source=(  rc.firefox-tmpfs
          confd.firefox-tmpfs )
md5sums=( 51916fe06a4b9afa39591a093b537458
          fa5d47bc7bfa10b58212aa66c39fd960 )

backup=(etc/conf.d/firefox-tmpfs)

package() {
  install -D $srcdir/rc.firefox-tmpfs $pkgdir/etc/rc.d/firefox-tmpfs
  install -D $srcdir/confd.firefox-tmpfs $pkgdir/etc/conf.d/firefox-tmpfs
  echo ">> Add firefox-tmpfs to the DAEMONS array in /etc/rc.conf"
  echo ">> DAEMONS=(... @firefox-tmpfs ...)"
  echo ">> Change default configuration in /etc/config/firefox-tmpfs"
}

# vim:set ts=2 sw=2 et:
