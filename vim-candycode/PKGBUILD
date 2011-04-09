# Maintainer: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
pkgname=vim-candycode
pkgver=1.0.1
pkgrel=4
pkgdesc="A colorful dark scheme with bright pastel colors "
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=1635"
license=('unknown')
depends=(vim)
source=('http://www.vim.org/scripts/download_script.php?src_id=6066')
md5sums=('8b115e7b2ed03eb949c9c0b2cf049012')

package() {
  cd "$srcdir"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 download_script.php?src_id\=6066 $_installpath/colors/candycode.vim
}
