# Maintainer: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: apkawa <apkawa@gmail.com>

pkgname=vim-mako
pkgver=0.6.1
pkgrel=3
pkgdesc="Adds support for the mako python template engine to vim."
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1858"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=9244
        license.txt)

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/syntax/mako.vim || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

md5sums=('13773e622f846c768611e1763532ded6'
         'efbd5986e691ce8c876fb86e8f5961ea')
