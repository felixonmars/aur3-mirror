# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=kover-git
pkgver=20090602
pkgrel=2
pkgdesc="Easy to use WYSIWYG CD cover printer with CDDB and CDTEXT support"
url="http://lisas.de/kover/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('kdelibs' 'libcdio')
makedepends=('pkgconfig' 'git')
conflicts=()
replaces=()
#source=(http://lisas.de/kover/${pkgname}-${pkgver}.tar.bz2)
#md5sums=('364bd68967bfada4f9961e14ab1d3a6c')
backup=()

_gitroot="http://lisas.de/kover/git"
#_gitname="kover"
_gitname="git"

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

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  cd $startdir/src/$pkgname
  cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
