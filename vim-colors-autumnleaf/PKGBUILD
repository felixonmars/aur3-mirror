# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-autumnleaf
pkgver=1.0
_srcid=2065
pkgrel=1
pkgdesc="The colors of a Finnish autumn morning captured and packed in a nice color scheme which is light orange/blue/green and doesn't strain the eye"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=1107"
license=('custom:vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('0902a38ad4b3befcb8c1860062ee9a0cd20e2a63366ca1f15d76cb7c10585d4d')

prepare() {
  msg 'Fixing colorname...'
  sed -i 's/autumn/autumnleaf/' "$srcdir/$pkgname"
}

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/autumnleaf.vim"
}
