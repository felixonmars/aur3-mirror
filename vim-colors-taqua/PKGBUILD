# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-taqua
pkgver=1.1
_srcid=4679
pkgrel=1
pkgdesc="Baby colors for use with aqua themes, by Eustaquio Rangel de Oliveira Jr."
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=594"
license=('custom:vim')
source=(taqua.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('70ec6401e4edfa8636e1d1814febc74dd346a2b5f36c65862a9647dd6482364d')

package() {
  install -Dm 644 "$srcdir/taqua.vim" "$pkgdir/usr/share/vim/vimfiles/colors/taqua.vim"
}
