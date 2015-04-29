# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-baycomb
pkgver=3.0
_srcid=22968
pkgrel=1
pkgdesc="A dark and light color scheme consisting primarily of red/orange & green/blue/purple"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=1454"
license=('custom:vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('2deaea1554d239f3d8fcd864b459f10bb0ac3a816e6ebb748315762adcd5de3d')

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/baycomb.vim"
}
