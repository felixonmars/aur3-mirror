# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-synabbrev
pkgver=0.1unix
_scriptid=10252
pkgrel=1
pkgdesc="Abbreviations that only happen outside comments"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=872"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('bf556bb33e33e46d49f0d884b5297921'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/synabbrev.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
