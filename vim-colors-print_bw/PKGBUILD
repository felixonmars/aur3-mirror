# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-print_bw
pkgver=1.1a
_srcid=23102
pkgrel=1
pkgdesc="This colorscheme is just black and white but uses the font attributes bold, italic, and underline"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=233"
license=('custom:vim')
source=(print_bw.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('6f2f50fc158d2393a9822bfe9c2bcb80f601508b5ff757280734aa40204f7af8')

package() {
  install -Dm 644 "$srcdir/print_bw.vim" "$pkgdir/usr/share/vim/vimfiles/colors/print_bw.vim"
}
