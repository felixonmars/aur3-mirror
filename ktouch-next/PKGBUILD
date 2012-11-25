# Contributor: Casper Clemence <maninalift "at" gmail {dot} com>
# Manteiner: Casper Clemence <maninalift "at" gmail {dot} com>
pkgname=ktouch-next
pkgver=20121027
pkgrel=1
pkgdesc="The upcoming QML-Based, version of the touch-type tutoring software"
arch=('i686' 'x86_64')
url="http://ktouch.sourceforge.net/"
license=('LGPL')
depends=('kdelibs>=4.9.0')
makedepends=('git' 'cmake' 'automoc4')
provides=('kdeedu-ktouch')
conflicts=('kdeedu-ktouch')
replaces=('ktouch-next-git')
install=ktouch-git.install

_gitroot="git://anongit.kde.org/ktouch"
_gitname="master"
_rev="9491f4f8"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  rm -rf $_gitname

  git clone -b $_gitname $_gitroot $_gitname
  cd $_gitname
  git reset --hard $_rev
  cd ..

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make DESTDIR="$pkgdir/" install || return 1
  rm -rf "$srcdir/$_gitname-build"
} 
