# Maintainer Danny Navarro <j@dannynavarro.net>

pkgname=vim-xmledit
pkgver=1.9.1
pkgrel=1
_scriptid=13387
pkgdesc="A filetype plugin to help edit XML, HTML, and SGML documents"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=301"
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}_${pkgver}.vba::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        'license.txt')
md5sums=('2adf6b2cef1f37b890f194386b458727'
         'cd49910a3dde6fe0a7e24ebe8cbf7066')

build() {
    cd ${srcdir}
    install -d {doc,ftplugin}
    vim -c "UseVimball ." -c "q" ${pkgname}_${pkgver}.vba
    install -Dm644 doc/xml-plugin.txt ${pkgdir}/usr/share/vim/vimfiles/doc/xml-plugin.txt || return 1
    install -Dm644 ftplugin/xml.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/xml.vim || return 1
    install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
