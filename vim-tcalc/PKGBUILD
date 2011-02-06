# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-tcalc
pkgver=0.11
_scriptid=8028
pkgrel=2
pkgdesc="A small ruby-based RPN-calculator"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2040"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('85b6f9cd00514f22f354538a9c8deef7'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/
    cp -aR ${srcdir}/tcalc/* ${pkgdir}/usr/share/vim/ && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

