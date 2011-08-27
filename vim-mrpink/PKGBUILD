# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-mrpink
pkgver=1
_scriptid=10957
pkgrel=1
pkgdesc="Dark not black colorscheme"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2704"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('8674beca34d170314d4fd83bbb62b4d7'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/mrpink.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
