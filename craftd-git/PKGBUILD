# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=craftd-git
pkgver=20111024
pkgrel=1
pkgdesc="A third-party implementation of the Minecraft SMP server protocol."
arch=('i686' 'x86_64')
url="http://mc.kev009.com/craftd"
license=('GPL')
depends=('libevent' 'libconfig' 'pcre')
makedepends=('git')

_gitroot=git://github.com/craftd/craftd.git
_gitname=craftd

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

  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
