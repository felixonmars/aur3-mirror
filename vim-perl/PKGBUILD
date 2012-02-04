# Maintainer: Dmitry Korzhevin <dkorzhevin at gmail dot com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-perl
pkgver=0.11
_scriptid=9087
pkgrel=3
pkgdesc="improved perl syntax highlighting"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2300"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('3e2c8c655cb5da4b6d26d1e94af276ea'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/perl.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
