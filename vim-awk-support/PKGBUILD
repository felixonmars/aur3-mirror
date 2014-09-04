# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-awk-support
pkgver=1.2
_srcid=21799
pkgrel=1
pkgdesc="AWK-IDE - Write and run AWK-scripts using menus and hotkeys"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4415"
license=('custom:vim')
source=(${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('67d1851be201a444ca8fa466bc53ac941457f5a751ad21b4cf042c90fda2b7bd')
install='vimdoc.install'

package() {
  cd "$srcdir"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload awk-support doc plugin syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
