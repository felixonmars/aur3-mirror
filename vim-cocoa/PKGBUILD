# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-cocoa
pkgver=0.1
_scriptid=10813
pkgrel=3
pkgdesc="Plugin for Cocoa/Objective-C development"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2674"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('21cfb455e23b0b2d4662a085f16c9b59'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,after,autoload,ftplugin,lib}
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "plugin" "ftplugin"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "after" "autoload" "lib"; do cp -aR ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

