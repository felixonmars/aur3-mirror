# Contributor: Laszlo Papp <djszapi @ gmail at com>
# Contributor: Hervé Cauwelier <herve @ oursours ¤ net>
# Maintainer: fauno <fauno@kiwwwi.com.ar>
pkgname=vim-css
pkgver=0.7
_scriptid=8846
pkgrel=6
pkgdesc="CSS color preview"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2150"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(css.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)

build() {
    install -Dm644 ${srcdir}/css.vim \
        ${pkgdir}/usr/share/vim/vimfiles/after/syntax/css.vim
    install -Dm644 ${srcdir}/license.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
md5sums=('31767f96a4881f83d9f30263af03ff2d'
         '3ffc24c85276712149bb18ac65248927')
