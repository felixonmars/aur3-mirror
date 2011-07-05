# Maintainer: Duong Pham <dthpham@gmail.com>

pkgname=dbus-daemon-proxy
pkgver=20110704
pkgrel=1
pkgdesc="Provides remote D-Bus connections over TCP"
arch=('i686' 'x86_64')
url="http://cgit.collabora.com/git/user/alban/dbus-daemon-proxy/"
license=('GPL2')
depends=('dbus-core' 'dbus-glib')
makedepends=('git')
provides=('dbus-daemon-proxy')

_gitroot=git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy
_gitname=dbus-daemon-proxy
_gitbranch=master

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
    msg2 "Local files updated"
  else
    git clone $_gitroot
    msg2 "Git checkout done"
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."
  make || return 1

  install -d "$pkgdir/usr/bin"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/"
}
