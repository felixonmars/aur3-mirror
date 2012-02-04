# Author: Felipe Morales <hel.sheep@gmail.com>
# Maintainer: Felipe Morales <hel.sheep@gmail.com>
pkgname=indimpc_gnome-shell
pkgver=20110706
pkgrel=2
pkgdesc="Minimalistic MPD client with support for multimedia keys and notifications (with gnome-shell integration)"
arch=(any)
url="https://github.com/fmoralesc/indimpc"
license=("GPL")
depends=("dbus-python" "python-notify" "python-mpd")
install=${pkgname}.install

_gitroot="git://github.com/fmoralesc/indimpc.git"
_gitname="indimpc"
_gitbranch="gnome-shell"

build() {
  cd "$srcdir"

  msg "Updating source code..."
  if [[ -d $_gitname ]]; then
    cd "$_gitname" && git pull origin 
  else
    git clone "$_gitroot" "$_gitname" -b "$_gitbranch$" --depth=1
  fi
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm0755 "indimpc.py" "$pkgdir/usr/bin/indimpc"
  install -Dm0755 "indimpc.desktop" "$pkgdir/etc/xdg/autostart/indimpc.desktop"
  install -Dm0644 "indimpc.rc" "$pkgdir/usr/share/doc/indimpc/indimpc.rc"
  install -Dm0644 "guake.patch" "$pkgdir/usr/share/doc/indimpc/guake.patch"
}
