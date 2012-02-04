# Maintainer: Mario Marín <mmfmarin at delete-ME-gmail dot com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-fuzzyfinder
pkgver=4.2.2
_scriptid=13961
pkgrel=2
pkgdesc="Fuzzy/Partial pattern explorer for buffer/file/MRU/command/bookmark/tag/etc"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1984"
license=('MIT')
depends=('vim' 'vim-l9')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
license.txt)
md5sums=('a05cb14a5803fc83cb602d56b279fb0f'
'3e8d18cc2d9591aefb4bcf06fb112fe9')

build() {
	install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,autoload}\
	${pkgdir}/usr/share/vim/vimfiles/autoload/fuf

	install -Dm755 ${srcdir}/doc/* \
	${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1

	install -Dm755 ${srcdir}/plugin/* \
	${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1

	install -Dm755 ${srcdir}/autoload/fuf.vim \
	${pkgdir}/usr/share/vim/vimfiles/autoload/ || return 1

	for x in autoload/fuf; do
		install -Dm775 ${srcdir}/$x/* \
		${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

	install -Dm755 ${srcdir}/license.txt \
	${pkgdir}/usr/share/licenses/${pkgname}/licenses.txt
}

# vim: set noexpandtab tabstop=8 shiftwidth=8 textwidth=132 autoindent
