# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-svipc
pkgver=20140916
pkgrel=1
pkgdesc="System V ipc wrappers for yorick (shared memory/semaphores/fork)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.maumae.net/yorick/doc/plugins.php"
groups=('science' 'yorick-all')
depends=('yorick')
makedepends=('yorick')

_gitroot="git://github.com/frigaut/yp-svipc.git"
_gitname="yp-svipc"

build() {
  cd ${srcdir}
  msg "Connecting to git repo..."
  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting script install..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build/yorick

  yorick -batch make.i
  make
}

package() {
  cd ${srcdir}/$_gitname-build/yorick
  make DESTDIR=${pkgdir} install
}
