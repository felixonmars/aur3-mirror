# Maintainer: Jason Seeley <jamiseeley (at) yahoo (dot) com>
# Contributer: Maintainer: Laszlo Papp <djszapi @ archlinux us>
#
pkgname=vim-viki
pkgver=3.19
_scriptid=14236
pkgrel=1
pkgdesc="A personal wiki for Vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=861"
license=('GPL')
depends=(vim-tlib)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,autoload,compiler,indent,syntax}
    install -d ${pkgdir}/usr/share/vim/vimfiles/ftplugin/bib

    vim -c "UseVimball ${srcdir}" -c "q" ${pkgname}.vba
    
    install -Dm644 ${srcdir}/doc/viki.txt ${pkgdir}/usr/share/vim/vimfiles/doc/
    install -Dm644 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/
    install -Dm644 ${srcdir}/autoload/* ${pkgdir}/usr/share/vim/vimfiles/autoload/
    install -Dm644 ${srcdir}/compiler/* ${pkgdir}/usr/share/vim/vimfiles/compiler/
    install -Dm644 ${srcdir}/indent/* ${pkgdir}/usr/share/vim/vimfiles/indent/
    install -Dm644 ${srcdir}/syntax/* ${pkgdir}/usr/share/vim/vimfiles/syntax/

    install -Dm644 ${srcdir}/ftplugin/viki.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/
    install -Dm644 ${srcdir}/ftplugin/bib/* ${pkgdir}/usr/share/vim/vimfiles/ftplugin/bib/

}

md5sums=('64ebd14609764e98b91f1e233e121e32')
