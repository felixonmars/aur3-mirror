# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-txtbrowser
pkgver=1.3.5
_scriptid=16207
pkgrel=2
pkgdesc="A plain text browser plugin for Vim."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2899"
license=('custom')
depends=('vim' 'ctags' 'vim-taglist')
groups=('vim-plugins')
install=vimdoc.install
source=("txtbrowser-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")

build() {
	cd ${srcdir}
	rm txtbrowser-${pkgver}.zip
}

package() {
	mkdir -p ${pkgdir}/usr/share/vim/vimfiles/
	mv ${srcdir}/* ${pkgdir}/usr/share/vim/vimfiles/
}
md5sums=('6c114576dd4f552b9f5027341fc502e0')
