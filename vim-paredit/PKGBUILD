# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-paredit
pkgver=0.9.12
_srcid=21254
pkgrel=1
pkgdesc="Paredit mode for Vim, extracted from vim-slimv for users who want to use a different SWANK client or don't need a SWANK client at all"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3998"
license=('custom:vim')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('a16550b00b07b4ac5e7aad5abb23a94f0924a5f77268dcac116643ceb3c5c490')
conflicts=('vim-slimv')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
