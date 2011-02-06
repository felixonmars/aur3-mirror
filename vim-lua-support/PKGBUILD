# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-lua-support
pkgver=1.1
_scriptid=7313
pkgrel=4
pkgdesc="Lua-IDE -- Write and run Lua-scripts using menus and hotkeys"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=1763"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('dc5c7f39f4eac33be7b7772751a26496'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,ftplugin,plugin,lua-support}

    for x in "doc"; do
		install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

    for x in "plugin" "ftplugin"; do
		install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/vimfiles/$x/ || return 1;
	done

    cp -aR ${srcdir}/lua-support/* ${pkgdir}/usr/share/vim/vimfiles/lua-support || return 1
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

