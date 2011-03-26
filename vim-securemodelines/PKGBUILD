# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-securemodelines
pkgver=20080424
_scriptid=8598
pkgrel=2
pkgdesc="Secure, user-configurable modeline support"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1876"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('aa1ba3b7048e2b926d23fdf2a3a3d02f'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/plugin/securemodelines.vim && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

