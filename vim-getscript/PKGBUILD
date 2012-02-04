# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-getscript
pkgver=29
_scriptid=8136
pkgrel=2
pkgdesc="Keep your plugins up-to-date! (semi-automatic retrieval)"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=642"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('9a4982bf101d49d03e51ba6e9282b874'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,autoload,GetLatest}
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "plugin" "GetLatest" "autoload"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

