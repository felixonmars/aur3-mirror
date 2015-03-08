# Maintainer: chliny <chliny11 at gmail dot com>

pkgname=neobundle-git
pkgver=2.1.812.g5e0a81a
pkgrel=1
pkgdesc="Ultimate Vim plugin manager inspired by Vundle"
arch=('any')
url="https://github.com/Shougo/neobundle.vim"
license=('GPL')
depends=('vim>=7.2.051')
makedepends=('git')
install=neobundle.install
source=('neobundle::git+https://github.com/Shougo/neobundle.vim.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/neobundle"
    git describe --tags | sed -E 's/^ver\.//;s/-/./g'
    
}
package() {
  cd "$srcdir/neobundle"

  instpath="$pkgdir/usr/share/vim/vimfiles"
  mkdir -p $instpath

  mkdir -p $instpath/doc
  cp -R ./doc $instpath

  mkdir -p $instpath/autoload
  cp -R ./autoload $instpath

  mkdir -p $instpath/plugin
  cp -R ./plugin $instpath

  mkdir -p $instpath/bin
  cp -R ./bin $instpath

  mkdir -p $instpath/ffdetect
  cp -R ./ftdetect $instpath

  mkdir -p $instpath/syntax
  cp -R ./syntax $instpath

  mkdir -p "$pkgdir/usr/share/neobundle"
  cp -R ./test  "$pkgdir/usr/share/neobundle/vimrc.sample"
}

