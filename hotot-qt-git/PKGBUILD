# Maintainer: speps <speps at aur dot archlinux dot org>

_uname=lyricat
_commit=e0c78bf
pkgname=hotot-qt-git
pkgver=20130303
pkgrel=1
pkgdesc="A lightweight & open source microblogging software (twitter identi.ca). Qt4 frontend."
arch=('i686' 'x86_64')
url="http://www.hotot.org/"
license=('LGPL3')
depends=('hotot-data-git' 'qtwebkit')
makedepends=('git' 'cmake' 'intltool' 'python2')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
install="$pkgname.install"

_gitroot="https://github.com/$_uname/Hotot.git"
_gitname="hotot"

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

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DWITH_GTK=OFF \
          -DWITH_GTK2=OFF \
          -DWITH_GTK3=OFF \
          -DWITH_QT=ON \
          -DWITH_QT5=OFF \
          -DWITH_KDE=OFF \
          -DWITH_CHROME=OFF \
          -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$_gitname-build/qt"
  DESTDIR="$pkgdir/" cmake -P cmake_install.cmake
}

# vim:set ts=2 sw=2 et:
