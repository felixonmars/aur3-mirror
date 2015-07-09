# Contributor: Jacek Roszkowski <j.roszk@gmail.com>

pkgname=vim-bufkill
_id=19161
pkgver=1.11
pkgrel=2
pkgdesc="Unload/delete/wipe a buffer, keep its window(s), display last accessed buffer(s)" 
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1147"
license=('GPL')
depends=('vim')
source=("bufkill.vim::http://www.vim.org/scripts/download_script.php?src_id=$_id")
sha1sums=('1a60d1ce182ef1f78fbf8e49de66e60a2376bb92')

package() {
  cd "$srcdir"
  install -Dm644 bufkill.vim "$pkgdir/usr/share/vim/vimfiles/plugin/bufkill.vim"
}

# vim:set ts=2 sw=2 et:
