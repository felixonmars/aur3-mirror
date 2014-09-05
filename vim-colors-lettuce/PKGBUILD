# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-colors-lettuce
pkgver=1.2
_srcid=7471
pkgrel=1
pkgdesc="Highly detailed dark color scheme for gui and 256 color terminal"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=1975"
license=('GPL3')
source=(lettuce.vim::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('2e4c29c9b9b21b6d38bbe3aa95b43f180bc136759eed8bce82242164801ed099')

prepare() {
  msg 'Removing ternary conditional...'
  sed -i "s@:?@@" lettuce.vim
}

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/lettuce.vim" "$pkgdir/usr/share/vim/vimfiles/colors/lettuce.vim"
}
