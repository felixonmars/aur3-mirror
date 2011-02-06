# Maintainer: Andriy Kovtun <kovtunos@yandex.ru>
pkgname=vim-proj
pkgver=1.5.1
_scriptid=12122
pkgrel=1
pkgdesc="Simple project tool"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2719"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tbz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

build() {
    install -Dm644 ${srcdir}/proj/plugin/proj.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/proj.vim || return 1
    install -Dm644 ${srcdir}/proj/doc/proj.txt ${pkgdir}/usr/share/vim/vimfiles/doc/proj.txt || return 1
}

md5sums=('c9fbd7813048c44aa472c454af22a6bd')
