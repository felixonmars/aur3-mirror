# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-netrw
pkgver=136
_scriptid=11979
pkgrel=1
pkgdesc="Network oriented reading, writing, and browsing (keywords: netrw ftp scp)"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=1075"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('be2a1800636dd0823f0060f4017b005b'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,syntax,autoload}
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "plugin" "autoload" "syntax"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

