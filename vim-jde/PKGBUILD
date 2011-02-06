# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-jde
pkgver=2.16.2
_scriptid=10992
pkgrel=4
pkgdesc="Vim - Just a Development Envirement (Java/C++)"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=1213"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('fed00ac7898ff636241ee6a1d2a6df1d'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,compiler,src,syntax} \
	${pkgdir}/usr/share/vim/vimfiles/autoload/xml/

    for x in doc; do
		install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

    cp -aR ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
	install -Dm755 ${pkgdir}/usr/share/vim/vimfiles/plugin/vjde/readtags \
	${pkgdir}/usr/bin/readtags
	rm ${pkgdir}/usr/share/vim/vimfiles/plugin/vjde/readtags

	for x in autoload/xml compiler syntax; do
		install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

	for x in `ls ${srcdir}/src/vjde/completion/`; do
		install -Dm644 ${srcdir}/src/vjde/completion/$x \
		${pkgdir}/usr/share/vim/vimfiles/src/vjde/completion/$x || \
		return 1;
	done

    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

