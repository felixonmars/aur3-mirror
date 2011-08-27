##
# Contributor: Todd Harbour <aur@quadronyx.org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##
pkgname=vim-conkyrc
pkgver=20050923
_scriptid=4621
pkgrel=4
pkgdesc="Conky conkyrc syntax highlighting"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1367"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('14af15829b26e101df5e020397fa0536'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm644 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/syntax/conkyrc.vim || return 1
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
