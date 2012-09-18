# Maintainer: WillyKaze <willykaze@willykaze.org>
pkgname=rtinfo-git
pkgver=20120918
pkgrel=1
pkgdesc="A small server/client for displaying remote information"
url="https://git.maxux.net/rtinfo/tree/README"
arch=('x86_64' 'i686')
license=('GPLv3')
provides=('rtinfo-client' 'rtinfo-server')
depends=('librtinfo' 'ncurses')
conflicts=()
source=()
md5sums=()

_gitname="rtinfo"
_gitroot="git://git.maxux.net/rtinfo"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  cd "${srcdir}/${_gitname}"
  make client server
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 rtinfo-client/rtinfo-client "$pkgdir/usr/bin/"
  install -Dm755 rtinfo-server/rtinfo-server "$pkgdir/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
