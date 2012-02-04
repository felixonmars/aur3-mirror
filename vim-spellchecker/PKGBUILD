# Maintainer: Liming Wang <lmwang @ gmail at com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-spellchecker
pkgver=2.2.2
_scriptid=1789
pkgrel=2
pkgdesc="Spell check text including LaTeX documents"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=499"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('cd0c195471fa83642a6c15abdae31d43'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,dict}
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1
    install -Dm755 ${srcdir}/dict/* ${pkgdir}/usr/share/vim/vimfiles/dict/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

