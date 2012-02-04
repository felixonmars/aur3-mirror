# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-lookupfile
pkgver=1.8
_scriptid=7671
pkgrel=2
pkgdesc="Lookup files using Vim7 ins-completion"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1581"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('0f192e6c56ab272ac08d17bdb366079f'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{autoload,doc,plugin}
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/doc/ || return 1
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/plugin/ || return 1
    install -Dm755 ${srcdir}/autoload/* ${pkgdir}/usr/share/vim/autoload/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

