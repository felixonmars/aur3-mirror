# Maintainer: Laszlo Papp <djszapi at archlinux us>
pkgname=vim-limp
pkgver=0.3.4
_scriptid=8771
pkgrel=4
pkgdesc="Lisp IDE"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2219"
license=('custom')
groups=('vim-plugins')
depends=('bash' 'perl')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('f285b1d2909aff19636105516f7fb494'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/ftplugin/lisp/vim ${pkgdir}/usr/bin ${pkgdir}/usr/share/doc/limp ${pkgdir}/usr/share/doc/limp/screenshots ${pkgdir}/usr/bin/hypertags
    install -Dm755 ${srcdir}/limp-${pkgver}/${pkgver}/vim/* ${pkgdir}/usr/share/vim/ftplugin/lisp/vim || return 1
    cp -aR ${srcdir}/limp-${pkgver}/${pkgver}/docs/* ${pkgdir}/usr/share/doc/limp/ || return 1
    cp -aR ${srcdir}/limp-${pkgver}/${pkgver}/bin/* ${pkgdir}/usr/bin/ || return 1
    ln -sf vim/limp.vim ${pkgdir}/usr/share/vim/ftplugin/lisp/limp.vim
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
}
