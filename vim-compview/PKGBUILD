# Maintainer: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Dmitry ixaphire_at-gmail-dot+com 
pkgname=vim-compview
pkgver=1.05
_scriptid=10385
pkgrel=1
pkgdesc="Compressed Search View for vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1803"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(compview.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('bc2eed5cabc7ff0f3c1f0a32d0f79a5c'
         '7a09ecbc355e8edf16ab237192bd2863')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/plugin
    install -Dm755 ${srcdir}/compview.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}
