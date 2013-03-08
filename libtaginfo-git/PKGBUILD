pkgname=libtaginfo-git
pkgver=20130307
pkgrel=1
pkgdesc="Library for reading media metadata"
arch=('any')
url="https://bitbucket.org/shuerhaaken/libtaginfo"
license=('GPL')
makedepends=('git')
provides=('taginfo_c')

_gitroot="https://bitbucket.org/shuerhaaken/libtaginfo.git"
_gitname="libtaginfo"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
  cd ${srcdir}/$_gitname-build || return 1

  export AUTOMAKE=automake
  ./autogen.sh
  make
  make DESTDIR="$pkgdir" install
}