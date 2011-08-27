# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-code_complete
pkgver=2.9
_scriptid=10778
pkgrel=3
pkgdesc="function parameter complete, code snippets, and much more"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=1764"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(code_complete.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('532fd1941227edefef1605b6ad1dc87d'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/code_complete.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/code_complete.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
