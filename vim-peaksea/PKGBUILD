# Maintainer: Sara <sara at archlinux dot us>
# Contributor: Laszlo Papp <djszapi at gmail dot com>

pkgname=vim-peaksea
pkgver=3.5
_scriptid=15675
pkgrel=2
pkgdesc="Refined color, contains both gui and cterm256 for dark and light background"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=760"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid} \
        license.txt \
        ignore.patch)
md5sums=('6c6505b4ca14fcfe226a68050015b1e5'
         'efbd5986e691ce8c876fb86e8f5961ea'
         '6388319d3c6d49ce953e5a6ef7361459')

package(){
  patch -p0 < "${srcdir}"/ignore.patch || return 1
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}"/usr/share/vim/vimfiles/colors/peaksea.vim || return 1
  install -Dm644 "${srcdir}"/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
