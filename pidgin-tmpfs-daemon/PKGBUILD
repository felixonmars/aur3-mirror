# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=pidgin-tmpfs-daemon
pkgver=0.4
pkgrel=5
pkgdesc="Sync all ~/.purple directories to tmpfs at boot and stop time"
arch=(any)
url=https://bbs.archlinux.org/viewtopic.php?id=118576
license=('GPL')
#depends=('pidgin' 'rsync')
conflicts=('pidgin-sync')
source=(  rc.pidgin-tmpfs
          confd.pidgin-tmpfs )
md5sums=( febd84bb5718d039fb2ad732a643357a
          3edb33d30207356e82fdbced5f4edab7 )

backup=(etc/conf.d/pidgin-tmpfs)

package() {
  install -m 755 -D $srcdir/rc.pidgin-tmpfs $pkgdir/etc/rc.d/pidgin-tmpfs
  install -m 644 -D $srcdir/confd.pidgin-tmpfs $pkgdir/etc/conf.d/pidgin-tmpfs
  echo ">> Add pidgin-tmpfs to the DAEMONS array in /etc/rc.conf"
  echo ">> DAEMONS=(... @pidgin-tmpfs ...)"
  echo ">> Change default configuration in /etc/config/pidgin-tmpfs"
}

# vim:set ts=2 sw=2 et:
