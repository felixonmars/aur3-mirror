# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: mosra <mosra@centrum.cz>
pkgname=kdevelop-controlflowgraph-git
pkgver=182.61e9a9c
_kdevver=16
pkgrel=1
pkgdesc="Static code visualization for KDevelop"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/devtools/plugins/kdev-control-flow-graph"
license=('GPL')
depends=('kdevplatform' 'kgraphviewer')
conflicts=('kdevelop-extra-plugins-controlflowgraph-git')
provides=('kdevelop-extra-plugins-controlflowgraph-git')
replaces=('kdevelop-extra-plugins-controlflowgraph-git')
makedepends=('cmake' 'automoc4' 'git')
source=('controlflowgraph::git+git://anongit.kde.org/kdev-control-flow-graph')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/controlflowgraph"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/controlflowgraph"

  # change the kdevelop version
  #sed -i "s|X-KDevelop-Version=.*|X-KDevelop-Version=$_kdevver|" kdevcontrolflowgraphview.desktop

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/controlflowgraph"
  make DESTDIR="$pkgdir" install
}
