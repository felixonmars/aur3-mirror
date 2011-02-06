# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=vim-squirrel
pkgver=0.2
pkgrel=1
pkgdesc='Squirrel Language syntax file'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2655'
license=('custom')
depends=('vim')
install=squirrel.install
source=('http://www.vim.org/scripts/download_script.php?src_id=12575')
sha1sums=('86601621e94e77970d9cd94587dff07b162dc301')

build() {
	install -d ${pkgdir}/usr/share/vim/vimfiles/after/syntax
	tr -d '\15\32' < ${srcdir}/squirrel/squirrel.vim > \
		${pkgdir}/usr/share/vim/vimfiles/after/syntax/squirrel.vim || return 1
	chmod 644 ${pkgdir}/usr/share/vim/vimfiles/after/syntax/squirrel.vim
}
