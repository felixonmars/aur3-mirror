# Author: Felipe Morales <hel.sheep@gmail.com>
# Maintainer: <grawity@gmail.com>
pkgname=indimpc
pkgver=1
pkgrel=1
pkgdesc="Minimalistic MPD client with support for multimedia keys and notifications"
arch=(any)
url="https://github.com/fmoralesc/indimpc"
license=("GPL")
depends=("python-dbus" "python-notify" "python-mpd")

_gitroot="git://github.com/fmoralesc/indimpc.git"
_gitname="indimpc"

build() {
  cd "$srcdir"

  msg "Updating source code..."
  if [[ -d $_gitname ]]; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
  fi
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm0755 "indimpc.py" "$pkgdir/usr/bin/indimpc"
  install -Dm0755 "$srcdir/indimpc.desktop" "$pkgdir/etc/xdg/autostart/indimpc.desktop"
}
