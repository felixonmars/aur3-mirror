# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=camp-git
pkgver=20100629
pkgrel=1
pkgdesc="C++ multi-purpose reflection library"
arch=('i686' 'x86_64')
url="http://dev.tegesoft.com/projects/camp/"
license=('LGPL')
depends=('boost')
makedepends=('cmake' 'git')
optdepends=('doxyen: generate API docs')
source=()
md5sums=()

_gitroot="git://github.com/tegesoft/camp.git"
_gitname="camp"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "${srcdir}/${_gitname}-build"

  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  # Check for optdepends and then attemt to generate docs
  if [[ $(which doxygen) ]]; then
    make doc
  else
    warning "doxygen not found, not making documentation"
  fi
}

package() {
  cd "${srcdir}/${_gitname}-build"

  cd build
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
