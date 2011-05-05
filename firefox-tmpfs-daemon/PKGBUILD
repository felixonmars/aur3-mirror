# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firefox-tmpfs-daemon
pkgver=0.1
pkgrel=1
pkgdesc="Sync all ~/.mozilla directories to tmpfs at boot and stop time"
arch=(any)
url=http://forum.hardware.fr/hfr/OSAlternatifs/Installation/nouveaute-stabilite-simplicite-sujet_37691_171.htm#t1277011
license=('GPL')
depends=('firefox' 'rsync')
conflicts=('firefox-sync')
source=(firefox-tmpfs)
md5sums=(de87cb23d7ae6018013db80ec0612e0e)

package() {
  install -D $srcdir/firefox-tmpfs $pkgdir/etc/rc.d/firefox-tmpfs
  echo "Add firefox-tmpfs to the DAEMONS array in /etc/rc.conf"
  echo "DAEMONS=(... @firefox-tmpfs ...)"
}

# vim:set ts=2 sw=2 et:
