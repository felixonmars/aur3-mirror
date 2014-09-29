# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-sorcerer
pkgver=1.4
_srcid=21909
pkgrel=1
pkgdesc="A heavily-reworked version of 'Mustang' by Henrique C. Alves, with lower-keyed colors"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3299"
license=('MIT')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('463588dbc38782c03f237e69d0ee11ec7b394cb13c90f9e09bc8119d6cb9afe9')

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/sorcerer.vim"
}
