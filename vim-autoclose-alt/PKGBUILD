# Maintainer: lolilolicon <lolilolicon#gmail#com>

_name=autoclose
pkgname=vim-autoclose-alt
pkgver=1.2
pkgrel=1
_scriptid=10873
pkgdesc="This plugin closes opened parenthesis, braces, brackets, quotes as you type them."
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=1849"
license=('custom')
depends=(vim)
groups=('vim-plugins')
conflicts=('vim-autoclose')
source=($_name-$pkgver.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('6b0c48454cdca88a127c11a978614c1f')

package() {
  cd "$srcdir"
  local installpath=$pkgdir/usr/share/vim/vimfiles
  install -D -m644 $_name-$pkgver.vim "$installpath"/plugin/$_name.vim
}
