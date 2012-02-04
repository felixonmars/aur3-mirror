# Contributor: Martin Sandsmark <sandsmark@samfundet.no>

pkgname=simpleplayer-git
pkgver=20090811
pkgrel=1
pkgdesc="Simple player for phonon, with visualizations"
url="http://gitorious.org/simpleplayer/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('phonon-svn')
makedepends=('git')
conflicts=()
replaces=()
backup=()
install=()
source=()
md5sums=()

_gitroot="git://gitorious.org/simpleplayer/simpleplayer.git"
_gitname="simpleplayer"

build() {
  cd ${srcdir}
  msg "Connecting to gitorious GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir -p $_gitname/build
  cd $_gitname/build

  cmake .. -DCMAKE_MODULE_PATH=/usr/share/apps/cmake/modules/
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
