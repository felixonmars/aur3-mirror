# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=vim-svg
pkgver=1.2
pkgrel=1
pkgdesc="SVG syntax file for VIM"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=935"
license=('unknown')
depends=('vim')
source=('svg.vim')
md5sums=('63bab5899c8b30eb881f2e8f3b4d412f') 

build() {
  cd $srcdir/

  install -d $pkgdir/usr/share/vim/syntax
  install svg.vim $pkgdir/usr/share/vim/syntax/
}

# vim:set ts=2 sw=2 et:
