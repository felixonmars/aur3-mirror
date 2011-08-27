# Contributor: atie H. <atie.at.matrix@gmail.com>
# Maintainer: Alex A <alex.anthony28991@googlemail.com>
pkgname=clutter-gesture-git
pkgver=20090810
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="http://www.moblin.org/"
license=('LGPL')
depends=('clutter-git')
options=('!libtool')
provides=('clutter-gesture')
conflicts=('clutter-gesture')
source=(new-clutter.patch)
md5sums=('077b6b661dbc78b3d7a41447d5746fea')

_gitroot="git://git.moblin.org/clutter-gesture"
_gitname="clutter-gesture"

build() {
  cd $srcdir
  msg "Connecting to git.moblin.org GIT server...."
  rm -rf $srcdir/$_gitname-build
  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir
  patch -p0 < $srcdir/new-clutter.patch 
  cd $srcdir/$_gitname-build
  msg "Starting build"
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
