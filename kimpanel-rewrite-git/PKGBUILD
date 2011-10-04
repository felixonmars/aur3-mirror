#Contributor: poplarch <poplarch@gmail.com>
pkgname=kimpanel-rewrite-git
pkgver=20111004
pkgrel=1
pkgdesc="A Rewrite Kimpanel"
arch=('i686' 'x86_64')
url="https://github.com/csslayer/kimpanel-rewrite"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('git' 'cmake' 'automoc4')
provides=(kimpanel-rewrite)
conflicts=('kimpanel-rewrite' 'kdeplasma-addons-applet-kimpanel')
source=()
md5sums=()

_gitroot="http://anongit.kde.org/kimpanel"
_gitname="kimpanel"

build(){
  cd "$srcdir"
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

  rm -rf "$srcdir/$_gitname-build"
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make DESTDIR=${pkgdir} install
}
