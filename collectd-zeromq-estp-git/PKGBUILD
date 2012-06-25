# Maintainer: Paul Colomiets <paul@colomiets.name>
pkgname=collectd-zeromq-estp-git
pkgver=20120625
pkgrel=1
pkgdesc="Collectd plugin which supports ESTP over ZeroMQ"
arch=('x86_64' 'i686')
url="https://github.com/estp/collectd-zeromq-estp"
license=('GPL')
depends=('collectd' 'zeromq<3.0')
makedepends=('git')
provides=('collectd-zeromq-estp')

_gitroot=https://github.com/estp/collectd-zeromq-estp.git
_gitname=collectd-zeromq-estp

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
  git submodule update --init

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
