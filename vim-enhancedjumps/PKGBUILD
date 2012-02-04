# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-enhancedjumps
pkgver=1.12
_scriptid=11025
pkgrel=2
pkgdesc="Enhanced jump list navigation commands"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2695"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('9f27d6c905263a0bd1ad543b52cb67b0'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,autoload}
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "plugin" "autoload"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

