# Contributor: Andrea Scarpino <marco_tangaro@hotmail.com>

pkgname=xqde-git
pkgver=20101112
pkgrel=1
pkgdesc="XQDE is the evolution of KXDocker, a new dock for KDE, Gnome, XFCE. It's working with composite extentions."
url="http://xqde.xiaprojects.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt>=4' 'libxcomposite')
makedepends=('git')
provides=('kmess')
conflicts=()
source=()
md5sums=()
options=()

_gitroot="git://xqde.git.sourceforge.net/gitroot/xqde/xqde"
_gitname="xqde"

build() {
 cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build/trunk

  qmake || return 1
  make || return 1
  install -D -m755 libxqdebase $pkgdir/usr/bin/xqde
}