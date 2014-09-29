# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-candyman
pkgver=1.3
_srcid=14346
pkgrel=1
pkgdesc="A colorful, dark color scheme like Jellybeans with clearer color demarcations"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3001"
license=('MIT')
source=(candyman.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('a4ae399150498b110f5f89699dc1371977e44398efe3f4f4015a1a486ee40881')
provides=('vim-colors-candyman' 'vim-candyman')
conflicts=('vim-candyman')
install=candyman.install

package() {
  install -Dm 644 "$srcdir/candyman.vim" "$pkgdir/usr/share/vim/vimfiles/colors/candyman.vim"
}
