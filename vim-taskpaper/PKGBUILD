# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-taskpaper
pkgver=0.4
_scriptid=8712
pkgrel=3
pkgdesc="TaskPaper to-do list format support"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2027"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('0b67b001ca0a69fd60f781787bbc4424'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,syntax,ftdetect,ftplugin}
    for x in "syntax" "ftdetect" "ftplugin"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

