# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-r-plugin2
pkgver=090610
_scriptid=10799
pkgrel=4
pkgdesc="Plugin to work with R"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2628"
license=('custom')
depends=('perl')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('ca0c7eeb9d6b440449f12e56f29c3ed3'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vimfiles/{doc,plugin,after,autoload,ftplugin,indent,tools,bitmaps}

    for x in autoload ftplugin indent tools bitmaps; do
		install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vimfiles/$x/ || return 1;
	done

    for x in doc; do
		install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vimfiles/$x/ || return 1;
	done

    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

