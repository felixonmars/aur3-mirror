# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-voof
pkgver=4.0b5
_scriptid=15284
pkgrel=1
pkgdesc="VOoM (Vim Outliner of Markers) is a plugin for Vim that emulates a two-pane text outliner."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2657"
license=('WTFPLv2')
depends=('vim' 'python2')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)

build() {
    install -d ${pkgdir}/usr/share/vim/
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
    rm license.txt
    rm ${pkgname}.zip
    mv * ${pkgdir}/usr/share/vim/vimfiles
}

md5sums=('073e863f268f11e2d8d70a99dfd31117'
         '389a9e29629d1f05e115f8f05c283df5')
