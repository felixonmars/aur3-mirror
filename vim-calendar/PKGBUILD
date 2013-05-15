# Maintainer: Wido <widomaker2k7@gmail.com>
# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-calendar
pkgver=2.9
_scriptid=19707
pkgrel=3
pkgdesc="This script create calender windows in vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=52"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
        license.txt)
sha256sums=('5bb1f0cf389159dd9a160a9d5d0f8aef5b3c7831905c1b4254b9080668c89f05'
            '4689a6d3ed3bca186ab8fea8360f32fdbb84f84c82fb21698390202efa7b7d19')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/plugin/calendar.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/calendar.vim"
    install -Dm755 "${srcdir}/autoload/calendar.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/calendar.vim"
    install -Dm755 "${srcdir}/doc/calendar.txt" "${pkgdir}/usr/share/vim/vimfiles/doc/calendar.txt"
    install -Dm755 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

