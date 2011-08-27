# Maintainer: Piotr Husiatyński <phusiatynski@gmail.com>
#
# Based on J. W. Birdsong luakit-develop-git PKGBUILD

pkgname=luakit-dbus-git
pkgver=20110325
pkgrel=1
pkgdesc="Luakit web browser with dbus support"
arch=('i686' 'x86_64')
url="http://github.com/husio/luakit/tree/dbus_support"
license=('GPL3')
depends=( 'libwebkit' 'luafilesystem' )
makedepends=('git' 'help2man')
options=(!makeflags)
source=($pkgname.install)
provides=(luakit)
conflicts=('luakit' 'luakit-git')
install=$pkgname.install

_gitroot="git://github.com/husio/luakit.git"
_gitname="dbus_support"
md5sums=('b57e0f9a212c385617a3eab158b6363a')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname -b $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  install -Dm644 "$srcdir/$_gitname-build/COPYING.GPLv3" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL"
  make PREFIX=/usr DESTDIR="$pkgdir/" clean all install
}
