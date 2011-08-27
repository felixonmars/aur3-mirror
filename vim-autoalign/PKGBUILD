# Maintainer: koral <koral at mailoo dot org>
pkgname=vim-autoalign
pkgver=13
pkgrel=1
pkgdesc="Automatically align as you type (autoalign): bib c c++ html maple matlab tex vim."
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=884"
license=('unknown')
groups=('vim-plugins')
provides=
depends=('vim' 'vim-align')
optdepends=
makedepends=
conflicts=
replaces=
backup=
install=vimdoc.install
_scriptid=7510
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('30cb59a0b2ce7756fedc1ef6d09b7ac5')

build() {
    cd ${srcdir}

    mkdir -p ${srcdir}/plugin
    mkdir -p ${srcdir}/ftplugin/bib
    mkdir -p ${srcdir}/ftplugin/c
    mkdir -p ${srcdir}/ftplugin/cpp
    mkdir -p ${srcdir}/ftplugin/html
    mkdir -p ${srcdir}/ftplugin/maple
    mkdir -p ${srcdir}/ftplugin/matlab
    mkdir -p ${srcdir}/ftplugin/tex
    mkdir -p ${srcdir}/ftplugin/vim
    mkdir -p ${srcdir}/doc

    vim -c "UseVimball ${srcdir}" -c "q" ${pkgname}.vba.gz

    install -Dm644 ${srcdir}/plugin/cecutil.vim             ${pkgdir}/usr/share/vim/vimfiles/plugin/cecutil.vim
    install -Dm644 ${srcdir}/plugin/AutoAlign.vim           ${pkgdir}/usr/share/vim/vimfiles/plugin/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/bib/AutoAlign.vim     ${pkgdir}/usr/share/vim/vimfiles/ftplugin/bib/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/c/AutoAlign.vim       ${pkgdir}/usr/share/vim/vimfiles/ftplugin/c/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/cpp/AutoAlign.vim     ${pkgdir}/usr/share/vim/vimfiles/ftplugin/cpp/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/html/AutoAlign.vim    ${pkgdir}/usr/share/vim/vimfiles/ftplugin/html/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/maple/AutoAlign.vim   ${pkgdir}/usr/share/vim/vimfiles/ftplugin/maple/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/matlab/AutoAlign.vim  ${pkgdir}/usr/share/vim/vimfiles/ftplugin/matlab/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/tex/AutoAlign.vim     ${pkgdir}/usr/share/vim/vimfiles/ftplugin/tex/AutoAlign.vim
    install -Dm644 ${srcdir}/ftplugin/vim/AutoAlign.vim     ${pkgdir}/usr/share/vim/vimfiles/ftplugin/vim/AutoAlign.vim
    install -Dm644 ${srcdir}/doc/AutoAlign.txt              ${pkgdir}/usr/share/vim/vimfiles/doc/AutoAlign.txt
}
