# Maintainer: Adam Dariusz Szkoda adaszko at Google's mail service

pkgname=vim-ragtag
pkgver=2.0
_scriptid=12338
pkgrel=1
pkgdesc="A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more (formerly allml.)"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=1896"
license=('custom')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('b03b77a1f987d1476b8a9c9bd27cccb6')

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin}

    install -D -m644 ${srcdir}/doc/ragtag.txt ${pkgdir}/usr/share/vim/vimfiles/doc || return 1
    install -D -m644 ${srcdir}/plugin/ragtag.vim ${pkgdir}/usr/share/vim/vimfiles/plugin || return 1
}
