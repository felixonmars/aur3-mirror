# Maintainer: Stefan Seering <stefanarch@gmx.de>
pkgname=qibuild-git
pkgver=20120415
pkgrel=2
pkgdesc='Compilation of C++ projects made easy. By http://developer.aldebaran-robotics.com/'
arch=('any')
url='https://github.com/aldebaran/qibuild'
license=('BSD')
depends=('python2' 'cmake')
makedepends=('git' 'python2' 'cmake' 'python2-sphinx')

_gitroot='https://github.com/aldebaran/qibuild.git'
_gitname='qibuild'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  # qiBuild ships with a installer shell script. However, it is meant for developers only so we use CMake here.
  cd "$srcdir/$_gitname-build/build"
  DESTDIR="${pkgdir}" make install
}

# vim:set ts=2 sw=2 et:
