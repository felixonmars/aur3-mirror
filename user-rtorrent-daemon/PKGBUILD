# Maintainer: Guten Ye

pkgname="user-rtorrent-daemon"
pkgver=0.1
pkgrel=4
pkgdesc="a rtorrent user daemon."
arch=("i686" "x86_64")
url="http://libtorrent.rakshasa.no"
license=("MIT")
depends=("screen" "rtorrent" "user-daemon-system-git")
source=("rc.rtorrent")

package() {
  cd "$srcdir"

  install -Dm755 rc.rtorrent "$pkgdir/home/$USER/etc/rc.d/rtorrent"

  chown $USER:$USER -R "$pkgdir/home/$USER"
}

# vim:set ts=2 sw=2 et:
md5sums=('9fa01c93808f2043fdfef00c8afd8741')
