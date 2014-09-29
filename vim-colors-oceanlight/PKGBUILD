# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-oceanlight
pkgver=0.1
_srcid=3753
pkgrel=1
pkgdesc="A light pale blue and green color scheme originally based on oceandeep"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=1176"
license=('custom:vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('161e031a656f9d5b3e02d185c77d239b09ab023404a2b5721a0f4edb0739c33d')

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/oceanlight.vim"
}
