# Maintainer: Mario Marín <mmfmarin@delete-ME-gmail dot com>
pkgname=vim-l9
pkgver=1.1
_scriptid=13948
pkgrel=2
pkgdesc="A Vim-script library, which provides some utility functions and commands for programming in Vim."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3252"
license=('MIT')
depends=('vim' 'python')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
license.txt)
md5sums=('46d322ed65e9601612f0c335c3c8fe7d'
'cef449bfdd7cc1ff396aff75f703b8aa')

build() {
	install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,autoload} \
	${pkgdir}/usr/share/vim/vimfiles/autoload/l9 

	install -Dm755 ${srcdir}/doc/* \
	${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1

	install -Dm755 ${srcdir}/plugin/* \
	${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1

	install -Dm755 ${srcdir}/autoload/l9.vim \
	${pkgdir}/usr/share/vim/vimfiles/autoload/ || return 1

	for x in autoload/l9; do
		install -Dm775 ${srcdir}/$x/* \
		${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

	install -Dm755 ${srcdir}/license.txt \
	${pkgdir}/usr/share/licenses/${pkgname}/licenses.txt
}

# vim: set noexpandtab tabstop=8 shiftwidth=8 textwidth=132 autoindent

