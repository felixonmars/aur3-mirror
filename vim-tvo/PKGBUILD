# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-tvo
pkgver=122
_srcid=5768
pkgrel=7
pkgdesc="The Vim Outliner - one of many"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=517"
license=('unknown')
groups=('vim-plugins')
depends=('vim')
conflicts=('vimoutliner' 'vim-vimoutliner')
replaces=('vimoutliner')
optdepends=('ruby: for otl2pod, opml2otl, doc2otl, otl2swiki'
            'antiword: for doc2otl')
install=vimdoc.install
source=(
  ${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid
  )
md5sums=('ded940d96731de00e4b653a3cdabde4c')

build() {
    cd ${srcdir}

    vimdir=${pkgdir}/usr/share/vim/vimfiles
    docdir=${pkgdir}/usr/share/doc/${pkgname}
    scriptsdir=${pkgdir}/usr/bin
    sharedir=${vimdir}/usr/share/${pkgname}
    
    install -d ${docdir}/
    install -m644 \
        ${srcdir}/{FAQ.txt,INSTALL,MANIFEST,README.otl,changes.txt,versions.txt,easy.gvimrc,easy.vimrc} \
        ${docdir}/

    install -d ${scriptsdir}/
    install -m755 ${srcdir}/{doc2otl,opml2otl,otl2*,otlParser.rb,pod2otl} \
        ${scriptsdir}/

    for x in bitmaps/TVO doc ftdetect ftplugin macros syntax; do
        install -d ${vimdir}/${x}/
        install -m644 ${srcdir}/${x}/* ${vimdir}/${x}/
    done

}

