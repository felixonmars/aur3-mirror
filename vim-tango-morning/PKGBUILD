# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-tango-morning
pkgver=0.3
_scriptid=10685
pkgrel=1
pkgdesc="Light Grey Tango color theme based on Morning"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2640"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('bebc4b48c8e228fb5c47ef4f91566811'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/colors/tango-morning.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
