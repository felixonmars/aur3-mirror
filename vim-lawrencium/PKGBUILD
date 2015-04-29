# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-lawrencium
pkgver=0.4.0
_srcid=22738
pkgrel=1
pkgdesc="Mercurial wrapper for Vim, inspired by tpope's fugitive.vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3861"
license=('custom:vim')
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('1fb9e487fc8a8292ff75c954d7a55ed7497ac4c168d4d3f722f9940f714540f1')
install=vimdoc.install

package() {
  cd "$srcdir/${pkgname##vim-}_$pkgver"
  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-lawrencium/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc ftdetect ftplugin plugin resources syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
