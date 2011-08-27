# Contributor: riverscn<riverscn at gmail.com>
# Contributor: Lee.MaRS<leemars at gmail.com>
pkgname=ibus-engine-git
pkgver=20080906
pkgrel=1
pkgdesc="IBus - Intelligent Input Bus, a next generation input framework."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus/"
license=('LGPL')
depends=('dbus-python>=0.83.0' 'gnome-python' 'python>=2.5.0' 'pyxdg')
makedepends=('git' 'cvs' 'qt>=4.4.0')
provides=('ibus-engine')
conflicts=('ibus-engine')
options=('!libtool')
install=ibus.install
source=()
md5sums=()

_gitroot="git://github.com/phuang/ibus.git"
_gitname="ibus"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -r "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
