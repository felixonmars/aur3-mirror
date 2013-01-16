# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-xml-git
pkgver=20130110
pkgrel=1
pkgdesc="KDevelop plugin for XML and HTML language support"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/devtools/plugins/kdev-xml"
license=('GPL')
depends=('kdevplatform-git')
optdepends=('kdevelop-git')
makedepends=('git' 'cmake' 'automoc4' 'kdevelop-pg-qt-git')

_gitroot="git://anongit.kde.org/kdev-xml"
_gitname="kdev-xml"

build() {
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir"
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
    -DCMAKE_BUILD_TYPE=Release ../$_gitname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
} 
