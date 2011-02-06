# Maintainer: Laszlo Papp <djszapi @ archlinux at us>
pkgname=vim-functionator
pkgver=1.0
_scriptid=11454
pkgrel=1
pkgdesc="Simple script that shows the name of the current function"
arch=('i686')
url="http://www.vim.org/scripts/script.php?script_id=2795"
license=('custom')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('304ab294c78253d1a14a17c971c714af'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/functionator.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
