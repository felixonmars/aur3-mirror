pkgname=dbusmenu-qt-git
pkgver=20100428
pkgrel=1
pkgdesc="A standalone library providing a way to import and export QMenu instances using the DBusMenu protocol."
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt' 'qjson')
makedepends=('git' 'cmake')
url="http://gitorious.org/dbusmenu/"
conflicts=('dbusmenu-qt')
provides=('dbusmenu-qt')
source=()
md5sums=()

_gitroot="git://gitorious.org/dbusmenu/dbusmenu-qt.git"
_gitname="dbusmenu-qt"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  
  mkdir $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build

  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr 
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  
  rm -rf $srcdir/$_gitname-build
}
