# Maintainer: speps <speps at aur dot archlinux dot org>

_uname=lyricat
_commit=e0c78bf
pkgname=hotot-data-git
pkgver=20130303
pkgrel=1
pkgdesc="A lightweight & open source microblogging software (twitter identi.ca)."
arch=('any')
url="http://www.hotot.org/"
license=('LGPL3')
depends=('hicolor-icon-theme')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
makedepends=('git' 'cmake' 'intltool' 'python2')
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
          -DWITH_QT=OFF \
          -DWITH_QT5=OFF \
          -DWITH_KDE=OFF \
          -DWITH_CHROME=OFF \
          -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  DESTDIR="$pkgdir/" cmake -P misc/cmake_install.cmake
  DESTDIR="$pkgdir/" cmake -P po/cmake_install.cmake

  # remove google analytics tracking code (tnx to ianux)
  find "$pkgdir" -name hotot.js -exec \
    sed -i '/\/\/ 7. run track code/,+12d' {} \;
}

# vim:set ts=2 sw=2 et:
