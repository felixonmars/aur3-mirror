# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-engspchk
pkgver=64
_scriptid=6351
pkgrel=3
pkgdesc="Spelling checker: On-the-fly spell checking, multi-language, alternate spellings"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=195"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('a50f07feb33aa5c5db5501af70940354'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin} ${pkgdir}/usr/share/vim/CVIMSYN/
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    for x in "plugin" "CVIMSYN"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/ || return 1; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}

