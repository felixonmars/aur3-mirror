# Maintainer: Guten Ye

pkgname="rtorrent-daemon"
pkgver=0.1
pkgrel=5
pkgdesc="a daemon for rtorrent"
arch=("i686" "x86_64")
url="http://libtorrent.rakshasa.no"
license=("MIT")
depends=("user-rtorrent-daemon")
backup=("etc/conf.d/rtorrent")
source=("rc.rtorrent"
        "conf.rtorrent")

package() {
  cd "$srcdir"

  install -Dm755 rc.rtorrent "$pkgdir/etc/rc.d/rtorrent"
  install -Dm644 conf.rtorrent "$pkgdir/etc/conf.d/rtorrent"
}

# vim:set ts=2 sw=2 et:
md5sums=('1caf724f332cbd1efdba04c9e2d7dd43'
         '77f1ed6fd2e097de1c14127a81ebf4ce')
