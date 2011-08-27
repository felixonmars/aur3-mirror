# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: mosra <mosra@centrum.cz>
pkgname=kdevelop-extra-plugins-controlflowgraph-git
pkgver=20110329
pkgrel=1
pkgdesc="Static code visualization for KDevelop"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kdereview/kdev-control-flow-graph"
license=('GPL')
depends=('kdevplatform-git' 'kgraphviewer')
makedepends=('cmake' 'automoc4' 'git')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/kdev-control-flow-graph"
_gitname="controlflowgraph"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname
    # Change remote url to anongit
    if [ -z $(git branch -v | grep anongit) ] ; then
      git remote set-url origin ${_gitroot}
    fi
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir"/$_gitname-build ]; then
        rm -rf "$srcdir"/$_gitname-build
  fi

  mkdir -p "$srcdir"/$_gitname-build
  cd "$srcdir"/$_gitname-build

  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/$_gitname-build
  make DESTDIR="$pkgdir" install
}
