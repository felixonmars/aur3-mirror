# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-verilog_systemverilog
pkgver=1.2
_scriptid=5995
pkgrel=2
pkgdesc="Extending Verilog syntax highlighting for SystemVerilog"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1586"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('f3d7f71c5246294afdc4eb7669134e2c'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{ftdetect,indent,syntax}
    install -Dm755 ${srcdir}/verilog_systemverilog/ftdetect/* ${pkgdir}/usr/share/vim/ftdetect/ && \
    install -Dm755 ${srcdir}/verilog_systemverilog/indent/* ${pkgdir}/usr/share/vim/ftdetect/ && \
    install -Dm755 ${srcdir}/verilog_systemverilog/syntax/* ${pkgdir}/usr/share/vim/ftdetect/ && \
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

