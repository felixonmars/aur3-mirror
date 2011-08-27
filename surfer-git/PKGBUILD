# created 23:15:00 - 02/04/10
# Contributor: PayableOnDeath <payableondeath90 at gmail.com>

pkgname=surfer-git
pkgver=20100413
pkgrel=1
pkgdesc="Simple web browser on QtWebKit that focus on usability"
url="http://gitorious.org/surfer"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt')
makedepends=('cmake' 'git')
conflicts=('surfer')

_gitroot='git://gitorious.org/surfer/surfer.git'
_gitname='surfer'

source=()
md5sums=()

build()
{
  cd $srcdir

  msg "Connecting to gitorious.org GIT server...."
  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  if [ -d $srcdir/$_gitname-build ]; then
      rm -r $srcdir/$_gitname-build
  fi
      cp -r $srcdir/$_gitname $srcdir/$_gitname-build
      cd $srcdir/$_gitname-build

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir .. || return 1
  make || return 1
  make install || return 1
}
