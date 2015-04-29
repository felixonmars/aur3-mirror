# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-ghcmod
pkgver=1.3.0
_srcid=23041
pkgrel=1
pkgdesc="Happy Haskell programming on Vim, powered by ghc-mod"
arch=('any')
depends=('haskell-ghc-mod' 'vim' 'vim-vimproc')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4473"
license=('BSD3')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('240be7731c1ece31186530b3b4aef4e74a38560984d50252c9f7864208755ab6')
install=vimdoc.install

package() {
  cd "$srcdir/ghcmod-vim-$pkgver"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after autoload doc; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
