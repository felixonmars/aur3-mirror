# Maintainer: Adria Arrufat <swiftscythe <at> gmail dot com>
#
#
pkgname=vim-fontsize
pkgver=0.3.1
pkgrel=1
pkgdesc="Key mappings for adjusting the font size in gVim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2809"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("fontsize-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=20878")

package () {

    cd $srcdir
    
    install -D -m 644 autoload/fontsize.vim \
        ${pkgdir}/usr/share/vim/vimfiles/autoload/fontsize.vim
    install -D -m 644 doc/fontsize.txt \
        ${pkgdir}/usr/share/vim/vimfiles/doc/fontsize.txt
    install -D -m 644 plugin/fontsize.vim \
        ${pkgdir}/usr/share/vim/vimfiles/plugin/fontsize.vim

}

md5sums=('db8b2587e17408ced8eb7ba8695155ff')
