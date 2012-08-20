# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <oliverDOTsherouseATgmailDOTcom>
pkgname=vimoutliner
pkgver=0.3.6
pkgrel=1
pkgdesc="Outline processor designed for lightning fast authoring "
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3515"
license=('GPL2')
depends=('vim')
conflicts=('vim-vimoutliner')
install=vimdoc.install
source=(https://github.com/downloads/$pkgname/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('1928092231296af34c00b1ff8eab7db0')

function copydir {
	files=`ls $1`
	for i in $files; do 
		if [[ -d $1/$i ]]; then
			copydir $1/$i $2/$i
		else
			install -Dm755 $1/$i $2/$i
		fi
	done
}

package() {
  cd "$srcdir/"
  vimdir="$pkgdir/usr/share/vim/vimfiles"
  copydir "colors" "$vimdir/colors"
  copydir "doc" "$vimdir/doc"
  copydir "ftdetect" "$vimdir/ftdetect"
  copydir "ftplugin" "$vimdir/ftplugin"
  copydir "syntax" "$vimdir/syntax"
  copydir "vimoutliner" "$vimdir/vimoutliner"
}

# vim:set ts=2 sw=2 et:
