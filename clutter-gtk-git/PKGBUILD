# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=clutter-gtk-git
pkgver=20090211
pkgrel=1
pkgdesc="Gtk+ libraries for Clutter"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('clutter-git' 'gtk2')
options=('!libtool')
provides=('clutter-gtk')
conflicts=('clutter-gtk' 'clutter-gtk-svn')
source=()
md5sums=()

_gitroot="git://git.clutter-project.org/clutter-gtk"
_gitname="clutter-gtk"

build() {
  cd $srcdir
  msg "Connecting to git.cairographics.org GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Starting build"
  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -rf $srcdir/$_gitname-build
}
