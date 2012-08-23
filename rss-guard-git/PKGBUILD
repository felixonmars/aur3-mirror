# Maintainer: Martin Rotter <rotter.martinos@gmail.com>
# Contributor: Petr Vanek <petr@scribus.info>

pkgname=rss-guard-git
pkgver=20120823
pkgrel=1
pkgdesc='A (very) tiny RSS & ATOM reader developed using Qt framework.'
arch=('i686' 'x86_64')
url="http://code.google.com/p/rss-guard/"
license=('GPL3')
depends=(qt qtwebkit hicolor-icon-theme)
makedepends=(gcc git cmake)
conflicts=(rss-guard)

_gitname=rss-guard
_gitroot=https://Rotter.Martinos@code.google.com/p/rss-guard/

build() {
  cd "$srcdir"
  msg "Cloning rss-guard repository..."
  
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    msg "The local files are updated..."
  else
    git clone $_gitroot
  fi

  msg "Git checkout done or server timeout..."
  cd "$srcdir/$_gitname"

  if [ ! -d "build" ]; then
    mkdir "build"
  fi
  
  cd "build"

  msg "Preparing files with cmake..."
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release

  msg "Compiling files..."
  make DESTDIR=${pkgdir} install || return 1

  msg "All files were successfully compiled..."
}
