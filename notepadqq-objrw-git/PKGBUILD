# Maintainer: Justin Kinnaird <teklad@gmx.com> 

pkgname=notepadqq-objrw-git
_gitname=notepadqq
pkgver=f121eae
pkgrel=2
pkgdesc="A Notepad++ clone. Git object_rewrite branch."
arch=('i686' 'x86_64')
url="https://github.com/notepadqq/notepadqq"
license=('GPLv3')
depends=('qscintilla' 'qt4')
makedepends=('git')
conflicts=('notepadqq')
provides=('notepadqq')
source=('git+https://github.com/notepadqq/notepadqq.git#branch=object_rewrite')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname/src
  qmake-qt4 notepadqq.pro -r -spec linux-g++
  make
  make clean
}

package() {
  cd $_gitname/src
  make PREFIX=/usr DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}
