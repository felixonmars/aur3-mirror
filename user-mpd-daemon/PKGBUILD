# Maintainer: Guten Ye

pkgname="user-mpd-daemon"
pkgver=0.1
pkgrel=3
pkgdesc="an mpd user daemon. README at https://github.com/GutenYe/ref/master/user-mpd-system"
arch=("i686" "x86_64")
url="http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki"
license=("MIT")
depends=("user-daemon-system-git" "mpd")
source=("rc.mpd")

package() {
  cd "$srcdir"

  install -Dm755 rc.mpd "$pkgdir/home/$USER/etc/rc.d/mpd"

  chown $USER:$USER -R "$pkgdir/home/$USER"
}

# vim:set ts=2 sw=2 et:
md5sums=('48063e0ab826a8aea7a4e73207e972b5')
