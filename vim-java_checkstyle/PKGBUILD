# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-java_checkstyle
pkgver=0.5
_scriptid=2157
pkgrel=1
pkgdesc="Integrates Checkstyle with Vim"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=448"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('2323c43ad074e41e0931bbf8b2974402'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

