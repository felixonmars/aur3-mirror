# Maintainer: Albert Chang <albert.chang@gmx.com>
pkgname=vim-lustyjuggler
pkgver=1.5.1
_scriptid=17547
pkgrel=1
pkgdesc='A high speed buffer juggler. Having to consciously think about which buffer you need to switch to sucks, so use this instead.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2050'
license=('custom')
depends=('vim>=7.0')
install=vimdoc.install
md5sums=('eb911a98585044840e57393c2394948b')

source=("${pkgname}"::"http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")

package() {
    cd "${srcdir}"

    find ./ -type f -exec chmod 644 "{}" \;

    mkdir -p "${pkgdir}/usr/share/vim/vimfiles/plugin"
    cp "${srcdir}/${pkgname}" "${pkgdir}/usr/share/vim/vimfiles/plugin/lusty-juggler.vim"
}
