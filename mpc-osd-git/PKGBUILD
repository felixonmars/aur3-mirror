# Maintainer: graysky <graysky AT archlnux DOT us>

pkgname=mpc-osd-git
_pkgname=mpc-osd
pkgver=20120414
pkgrel=1
pkgdesc="Simple python script that displays information about the current song being played through the org.freedesktop.Notifications DBus interface."
arch=(any)
url="http://mpd.wikia.com/wiki/Mpc_OSD"
license=('Artistic2.0')
depends=('python2' 'python-mpd' 'notification-daemon')
makedepends=('git')
install=mpc-osd.install

_gitroot=git://github.com/emerinohdz/Mpc-OSD.git
_gitname=Mpc-OSD

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 mpc_osd.py "$pkgdir"/usr/bin/mpc_osd
}
