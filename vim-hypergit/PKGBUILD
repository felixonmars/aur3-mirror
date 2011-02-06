# Maintainer: Albert Chang <albert.chang@gmx.com>
pkgname=vim-hypergit
pkgver=0.7
_scriptid=12689
pkgrel=1
pkgdesc='git plugin for vim (with a git tree menu)'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2954'
license=('custom')
depends=('vim>=7.0' 'git')
install=vimdoc.install

source=("${pkgname}-${pkgver}.tar.gz"::"http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
md5sums=('42947df1aedc19f0b844d7a4a0930092')

package() {
    cd "${srcdir}"

    find ./ -type f -exec chmod 644 "{}" \;

    _installdir="${pkgdir}/usr/share/vim/vimfiles"

    mkdir -p ${_installdir}
    cp -rv after ${_installdir}
    cp -rv autoload ${_installdir}
    cp -rv doc ${_installdir}
    cp -rv plugin ${_installdir}
    cp -rv syntax ${_installdir}
}
