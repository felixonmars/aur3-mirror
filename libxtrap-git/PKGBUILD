#Maintainer: Matt Parnell /ilikenwf <parwok@gmail.com>

pkgname=libxtrap-git
pkgver=20080808
pkgrel=2
pkgdesc="X11 event trapping extension library"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxext-git' 'libxt' 'trapproto')
makedepends=('pkgconfig')
options=(!libtool)
source=()
md5sums=()
provides=('libxtrap' 'libxtrap-git')
conflicts=('libxtrap')
replaces=('libxtrap')

_gitroot="git://anongit.freedesktop.org/git/xorg/lib/libXTrap"
_gitname="libXTrap"

build() {

 msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

cd $startdir/src/$_gitname

  sh autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

}
