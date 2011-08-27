# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-fastiane
pkgver=0.21
_scriptid=10860
pkgrel=1
pkgdesc=" a tool to help you quick edit and save abbreviation, snippets .etc"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2669"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('0c1a16eb764fca99f0f1b39068c5af1b'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

