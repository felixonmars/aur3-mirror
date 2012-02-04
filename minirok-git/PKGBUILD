# Contributor: Your Name <your@mail.org>

pkgname=minirok-git
pkgver=20090913
pkgrel=1
pkgdesc="small media player"
url="http://chistera.yi.org/~adeodato/code/minirok/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('pyqt' 'mutagen' 'gstreamer0.10-python' 'dbus-python' 'lastfmsubmitd')
makedepends=('git')
conflicts=('minirok')
provides=('minirok')
source=()
md5sums=()

_gitroot="git://git.debian.org/~adeodato/minirok"
_gitname="minirok"

build() {
  cd ${srcdir}
  msg "Connecting to git.debian.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  DEBIAN_PREFIX=$startdir/pkg ./setup.sh install
} 
