# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-filebeagle
pkgver=2.0.0
_srcid=22813
pkgrel=1
pkgdesc="A VINE-spired (Vim Is Not Emacs) file system explorer"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4962"
license=('MIT')
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('6da4daf32c9a89dee078d6a87d7e12034a2c313536ab8bc818803f3349d598fe')
install=vimdoc.install

package() {
  cd "$srcdir/$pkgname"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-filebeagle/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
