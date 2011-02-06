# Maintainer: Karl Kochs <captainhaggy at i2pmail dot org>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-cutetodo
pkgver=1.1
_scriptid=11004
pkgrel=4
pkgdesc="Manage to-do lists within vim"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2686"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('e5e7b07294399f3c8917daeccab44c71'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
    install -d ${pkgdir}/usr/share/vim/{doc,plugin,signs}
    for x in "doc"; do install -Dm644 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/; done
    for x in "plugin" "signs"; do install -Dm755 ${srcdir}/$x/* ${pkgdir}/usr/share/vim/$x/; done
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

