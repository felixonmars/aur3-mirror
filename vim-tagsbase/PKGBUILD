# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-tagsbase
pkgver=0.9.2
_scriptid=382
pkgrel=4
pkgdesc="Creates a menu of tags (functions, fields...) keep track of the current function"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=100"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('8461917b58327dcd911a6078d2a26e0e'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,ftplugin,plugin,plugin/perl,syntax}

    for x in ftplugin syntax; do
		install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

	install -Dm644 $srcdir/plugin/TagsBase.vim \
	$pkgdir/usr/share/vim/vimfiles/plugin/TagsBase.vim

	for x in `ls plugin/perl/` ; do
		install -Dm644 ${srcdir}/plugin/perl/$x \
		${pkgdir}/usr/share/vim/vimfiles/plugin/perl/$x;
	done

    for x in doc; do
		install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

