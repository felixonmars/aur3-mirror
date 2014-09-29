# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-matrix
pkgver=1.0
_srcid=2053
pkgrel=1
pkgdesc="Matrix-like color scheme for Vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=669"
license=('custom:vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('1c215c5c53ecf32c18defd9f7d02bdabae802dd63d23329f9d4439a5dbf1f38d')

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/matrix.vim"
}
