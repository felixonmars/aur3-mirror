# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-nqc
pkgver=3.1
_scriptid=3739
pkgrel=2
pkgdesc="programming support (for the LEGO MINDSTORMS RCX-Controller)"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=67"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('1b938a82116a4b62051dc4693c481c50'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,ftplugin,plugin,rc}
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    cp -aRf ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    for x in "ftplugin" "rc"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

