# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-dutyl
pkgver=1.5.0
_srcid=23222
pkgrel=1
pkgdesc="Coordinate D tools to work together for you"
arch=('any')
depends=('dcd' 'dscanner' 'dub' 'vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=5003"
license=('custom:vim')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('1b1f262432fd62aa270c91a377bf6ff2b20b930de2eedf3a5554125f1caf0003')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc ftplugin plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
