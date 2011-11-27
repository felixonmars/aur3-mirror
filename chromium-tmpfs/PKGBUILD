# Maintainer: Guten Ye <ywzhaifei@gmail.com>

pkgname="chromium-tmpfs"
pkgver=0.4
pkgrel=5
pkgdesc="Sync all ~/.config/chromium and ~/.cache/chromium directories to tmpfs"
arch=(any)
url="https://github.com/GutenYe/chromium-tmpfs"
license=('MIT-LIENCE')
depends=('chromium' 'rsync')
source=(  rc.chromium-tmpfs
          confd.chromium-tmpfs )
md5sums=('5c5aecc8944aa252412b248fb9b3b7e0'
         'fa5d47bc7bfa10b58212aa66c39fd960')

backup=(etc/conf.d/chromium-tmpfs)

package() {
  install -m 755 -D $srcdir/rc.chromium-tmpfs $pkgdir/etc/rc.d/chromium-tmpfs
  install -m 644 -D $srcdir/confd.chromium-tmpfs $pkgdir/etc/conf.d/chromium-tmpfs
  echo ">> Add chromium-tmpfs to the DAEMONS array in /etc/rc.conf"
  echo ">> DAEMONS=(... @chromium-tmpfs ...)"
  echo ">> Change default configuration in /etc/config/chromium-tmpfs"
}

# vim:set ts=2 sw=2 et:
