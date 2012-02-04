# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=clutter-mozembed-git
pkgver=20090706
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=()
options=('!libtool')
provides=('clutter-mozembed')
conflicts=('clutter-mozembed')
source=()
md5sums=()

_gitroot="git://git.clutter-project.org/clutter-mozembed"
_gitname="clutter-mozembed"

build() {
  cd $srcdir
  msg "Connecting to git.clutter-project.org GIT server...."
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
  cd $srcdir/$_gitname-build

  msg "Starting build"
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
