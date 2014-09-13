# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-clever-f
pkgver=1.4
_srcid=22293
pkgrel=1
pkgdesc="Extends f, F, t and T mappings for more convenience"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4707"
license=('MIT')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('1ca61f2c1012dd89103e0295c6e95b32567a734c75383664bfef99cba4f3996a')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-clever-f/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
