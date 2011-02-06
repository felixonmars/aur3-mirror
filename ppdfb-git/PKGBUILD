# Contributor: Georgios N. Tsalikis <aliverius@tsalikis.net>

pkgname=ppdfb-git
pkgver=20110116
pkgrel=1
pkgdesc="Advanced C++ binding for DirectFB"
arch=(i686 x86_64)
url="http://www.directfb.org"
license="LGPL2"
depends=('directfb')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://git.directfb.org/git/directfb/extras/++DFB.git"
_gitname="++DFB"


build() {
  msg "Connecting to git.directfb.org GIT server...."

  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done"

  # Remove old -build
  rm -rf $startdir/src/$_gitname-build

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  msg "Starting make..."

  ./autogen.sh --prefix=/usr
  make 
  make DESTDIR=${pkgdir} install
}