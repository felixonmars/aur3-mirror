# Author: Vincent Driessen <vincent [at] 3rdcloud.com>
# Maintainer: Loïc Bidoux <loic.bidoux [at] owndata.org>

_name=togglemouse
pkgname=vim-$_name
pkgver=1.0
pkgrel=1
pkgdesc="Toggles the mouse focus between Vim and your terminal emulator, allowing terminal emulator mouse commands, like copy/paste."
arch=(any)
url=http://www.vim.org/scripts/script.php?script_id=3166
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=($_name.vim::http://www.vim.org/scripts/download_script.php?src_id=13406)
md5sums=('699bcb6f5d1442d40f8b441fcb16f28e')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/vim/vimfiles/plugin
  install -m644  $srcdir/$_name.vim $pkgdir/usr/share/vim/vimfiles/plugin/
}
