# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Zhang Li <msfxzi at sina.com>
pkgname=vim-errormarker
pkgver=0.1.13
pkgrel=1
pkgdesc="Highlights and sets error markers for lines with compile errors"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1861"
license=('custom')
groups=('vim-plugins')
provides=('vim-errormarker')
conflicts=('vim-errormarker')
install=vimdoc.install
source=('errormarker.vim' 'errormarker.txt')
build() {
    install -Dm644 ${srcdir}/errormarker.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/errormarker.vim
    install -Dm644 ${srcdir}/errormarker.txt ${pkgdir}/usr/share/vim/vimfiles/doc/errormarker.txt
}
md5sums=('2454192ef17da1ea414934f73804cb60'
         'da95f1a54499a26f8e9a1759f73fef10')
