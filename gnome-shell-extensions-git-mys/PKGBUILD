# Contributor: mariusz - myswiat <my.swiat@o2.pl>

pkgname=gnome-shell-extensions-git-mys
pkgver=20110704
pkgrel=1
pkgdesc="Modify and extend GNOME Shell functionality and behavior"
arch=('i686' 'x86_64')
url="http:gnome.org/"
license=('LGPL')
depends=('gnome-shell')
options=('!libtool')
provides=()
conflicts=()
source=()
md5sums=()

_gitroot="http://git.gnome.org/browse/gnome-shell-extensions"
_gitname="gnome-shell-extensions"

build() {
  cd $srcdir
  msg "Connecting to git.gnome.org GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull master
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Starting build"
  ./autogen.sh -prefix=/usr
  make
  make DESTDIR=$pkgdir install

  rm -rf $srcdir/$_gitname-build
}
