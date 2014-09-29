# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-zenesque
pkgver=1.8
_srcid=14642
pkgrel=1
pkgdesc="Almost colorless (shades of grey), light minimalistic color scheme designed for reading for long periods"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3340"
license=('MIT')
source=(zenesque.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('4fc61bc980623adbffa8bd88096a4122b96697d83da9e599a98cbd8d5c56f799')
provides=('vim-colors-zenesque' 'vim-zenesque')
conflicts=('vim-zenesque')
install=zenesque.install

package() {
  install -Dm 644 "$srcdir/zenesque.vim" "$pkgdir/usr/share/vim/vimfiles/colors/zenesque.vim"
}
