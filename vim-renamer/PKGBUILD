# Contributor: lang2
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Maintainer:  Matt Monaco <net 0x01b dgbaley27>

pkgname=vim-renamer
pkgver=1.4
_srcid=16876
pkgrel=1
pkgdesc="Use the power of vim to rename groups of files"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=1721"
license=('GPL')
groups=('vim-plugins')
source=("renamer-$pkgver.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid")
md5sums=('4158359a366e149135dc6fb197e105de')

package() {
	cd "$srcdir"
	install -Dm644 "renamer-$pkgver.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/renamer.vim"
}

# vim: set noet :
