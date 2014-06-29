#Maintainer: olantwin <olantwin at gmail dot com>
pkgname=vim-syntax-root
pkgver=0.4.1
pkgrel=1
pkgdesc="Basic syntax highlighting for the ROOT Data Analysis Framework"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2387"
license=('custom:vim')
depends=(vim)
source=(cern_root.vim::http://www.vim.org/scripts/download_script.php?src_id=12875)
md5sums=('0a708f81548cc0e68fa508fe7c49ed75')

package() {
  install -Dm 644 "$srcdir/cern_root.vim" "$pkgdir/usr/share/vim/vimfiles/after/syntax/c.vim"
}
