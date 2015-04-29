# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-github
pkgver=1.2
_srcid=23147
pkgrel=1
pkgdesc="Port of GitHub's lovely light-background syntax highlighting theme to Vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=2855"
license=('custom:vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('c231f98d55f884d3b85a55e449512be71daf30f34add04ab03d251acfb3f6f3d')

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/github.vim"
}
