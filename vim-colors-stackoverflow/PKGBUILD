# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-stackoverflow
pkgver=1.1
_srcid=14391
pkgrel=1
pkgdesc="Color scheme emulating StackOverflow's code highlights"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3343"
license=('MIT')
source=(stackoverflow.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('4d30c81a2ae020dbf4a91721df46917aa65d90bc747bedb2c8730a17990d4f02')
provides=('vim-colors-stackoverflow' 'vim-stackoverflow')
conflicts=('vim-stackoverflow')

package() {
  install -Dm 644 "$srcdir/stackoverflow.vim" "$pkgdir/usr/share/vim/vimfiles/colors/stackoverflow.vim"
}
