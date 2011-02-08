# Maintainer: Rickey Visinski <rickeyvisinski at gmail dot com>
# Created by: Rene Köcher <shirk at bitspin.org>

pkgname=vim-gas
pkgver=0.8
_scriptid=11980
pkgrel=3
pkgdesc="Updated GAS Asm highlighting"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2863"
license=('unknown')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(gas.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('f44c77f3784079987289e4863355e436')

build() {
    install -Dm755 ${srcdir}/gas.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/asm.vim
}

