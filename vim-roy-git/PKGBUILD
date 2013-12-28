# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=vim-roy-git
_gitname="Vim-Roy"
pkgver=12.b418529
pkgrel=1
pkgdesc="Vim syntax support for the functional compile-to-js language Roy"
arch=('any')
url="https://github.com/jb55/$_gitname"
license=('BSD')
depends=('vim')
makedepends=('git')
provides=('vim-roy')
conflicts=('vim-roy')

source=("git://github.com/jb55/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname

  for d in syntax indent ftdetect ftplugin; do
    install -D -m644 $d/roy.vim "${pkgdir}/usr/share/vim/vimfiles/$d/roy.vim"
  done
} 
