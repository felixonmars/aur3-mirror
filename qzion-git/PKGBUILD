pkgname=qzion-git
pkgver=20090111
pkgrel=1
pkgdesc="An canvas abstraction used by and made for QEdje"
url="http://dev.openbossa.org/trac/qedje"
arch=(i686 x86_64)
license=(GPL)
depends=('qt' 'kdelibs' 'kdebase')
makedepends=('cmake')
source=()
md5sums=()

_gitroot="http://dev.openbossa.org/qedje/qzion.git"
_gitname="qzion"

build() {
  cd ${srcdir}
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
} 
