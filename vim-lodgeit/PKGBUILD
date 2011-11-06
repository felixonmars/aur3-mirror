# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>
# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=vim-lodgeit
pkgver=0.2
pkgrel=2
pkgdesc="A VIM script that pastes code to paste.pocoo.org"
arch=('any')
license=('unknown')
url="http://www.vim.org/scripts/script.php?script_id=1965"
depends=('vim')
source=("lodgeit.vim::http://www.vim.org/scripts/download_script.php?src_id=8848")
md5sums=('43eaa9afa3e0029d20378874124d3653')

package() {

  cd $srcdir/
  install -d $pkgdir/usr/share/vim/vimfiles/plugin
  install lodgeit.vim $pkgdir/usr/share/vim/vimfiles/plugin/
}

# vim:set ts=2 sw=2 et:
