# Maintainer: Chahine <chahine dot moreau at gmail dot com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-sql_iabbr
pkgver=1.5
_scriptid=1414
pkgrel=2
pkgdesc="Makes all your favorite SQL keywords uppercase automatically"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=305"
license=('unknown')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('64d6650456c2219150d280784a26cc45')

build() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/ftplugin/sql_iabbr.vim
}
