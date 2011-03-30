# Maintainer: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=kgraphviewer-git
pkgver=20110330
pkgrel=1
pkgdesc="A Graphviz dot graph file viewer for KDE"
arch=('i686' 'x86_64')
url="http://extragear.kde.org/apps/kgraphviewer/"
license=('GPL' 'FDL')
depends=('kdebase-runtime' 'graphviz')
makedepends=('git')
provides=(kgraphviewer=2.1)
conflicts=('kgraphviewer')
install=kgraphviewer-git.install
source=()
md5sums=()

_gitroot="git://anongit.kde.org/kgraphviewer.git"
_gitname="kgraphviewer"

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
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
