# Maintainer: Daniel Micay <danielmicay@gmail.com>
_gitname=vim-rst-tables
pkgname=vim-rst-tables-git
pkgver=32.72bb0d5
pkgrel=1
epoch=1
pkgdesc="Easily create and reformat your RST (reStructuredText) tables as you change cell content."
arch=(any)
url="https://github.com/nvie/vim-rst-tables"
license=('GPL')
depends=(vim_bridge-git)
makedepends=('git')
source=(git://github.com/nvie/vim-rst-tables.git)
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  python2 ./build.py
}

package() {
  cd $_gitname
  install -Dm644 ftplugin/rst_tables.vim $pkgdir/usr/share/vim/vimfiles/ftplugin/rst_tables.vim
}
