# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-cuteerrormarker
pkgver=1.3.2
_scriptid=11003
pkgrel=1
pkgdesc="Display error marks on line which contain errors after compilation"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2653"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('0762810846b711a95fc8eb04b27deaad'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{signs,plugin}
    install -Dm755 ${srcdir}/signs/* ${pkgdir}/usr/share/vim/signs/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

