# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-minscm
pkgver=0.6.0
_scriptid=10836
pkgrel=3
pkgdesc="An abstract front-end for Mercurial/Git/Bazaar"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2637"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('b6a40c3573ddeac763584d3a38751cef'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,syntax} ${pkgdir}/usr/share/vim/autoload/minscm
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "plugin" "syntax"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    cp -aR ${srcdir}/autoload/* ${pkgdir}/usr/share/vim/autoload/ || return 1
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

