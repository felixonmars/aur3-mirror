# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qgit-git-qt5
pkgver=609.08866c9
pkgrel=1
pkgdesc="A GIT GUI viewer built on Qt/C++"
url="http://libre.tibirna.org/projects/qgit"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base' 'git')
conflicts=('qgit')
provides=('qgit')
source=("git://repo.or.cz/qgit4/redivivus.git"
        'qgit.desktop' 'qgit.png')
md5sums=('SKIP'
         'ecb8b35e17163a7ec6893ffa71445c40'
         '85138f44d577b03dfc738d3f27e04992')

pkgver() {
  cd redivivus
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd redivivus
  git checkout compile_with_qt5
}

build() {
  cd redivivus
  qmake
  make
}

package() {
  cd redivivus
  install -Dm755 bin/qgit ${pkgdir}/usr/bin/qgit
  install -Dm644 ${srcdir}/qgit.desktop ${pkgdir}/usr/share/applications/qgit.desktop
  install -Dm644 ${srcdir}/qgit.png ${pkgdir}/usr/share/pixmaps/qgit.png
}
