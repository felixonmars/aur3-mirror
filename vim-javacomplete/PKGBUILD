pkgname=vim-javacomplete
pkgver=0.77.1.2
_scriptid=14914
pkgrel=1
pkgdesc="Omni Completion for JAVA"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1785"
license=('custom')
groups=('vim-plugins')
depends=('vim')
install='vimdoc.install'
source=("$pkgname"::'http://www.vim.org/scripts/download_script.php?src_id=$_scriptid'
	'license.txt')
md5sums=('8421aed161a831895eb6a3219ab7d298'
	'efbd5986e691ce8c876fb86e8f5961ea')

build() {
	install -d $pkgdir/usr/share/vim/vimfiles/{doc,autoload}
	install -Dm755 $srcdir/doc/* $pkgdir/usr/share/vim/vimfiles/doc/
	install -Dm755 $srcdir/autoload/* \
		$pkgdir/usr/share/vim/vimfiles/autoload/
	install -Dm755 $srcdir/license.txt \
		$pkgdir/usr/share/licenses/$pkgname/license.txt
}
