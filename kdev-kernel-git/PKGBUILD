# Maintainer: laloch <laloch@atlas.cz>
pkgname=kdev-kernel-git
pkgver=20130506
pkgrel=1
pkgdesc="KDevelop plugin for hacking the Linux kernel"
arch=('i686' 'x86_64')
url="https://github.com/Gnurou/kdev-kernel"
license=('GPLv3')
groups=()
depends=('kdevelop>=4.5.0')
makedepends=('cmake' 'automoc4' 'git')
install=

_gitroot=git://github.com/Gnurou/kdev-kernel.git
_gitname=kdev-kernel

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

  #
  # BUILD HERE
  #
  msg2 'Starting make...'
  cmake ${srcdir}/${_gitname} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
