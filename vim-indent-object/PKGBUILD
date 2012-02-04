# Maintainer: vae77 <fernandogrd@yahoo.com.br> 

pkgname=vim-indent-object
pkgver=1.1.2
pkgrel=1
pkgdesc="This plugin defines a new text object, based on indentation levels. This is very useful in languages such as Python, in which the syntax defines scope in terms of indentation. Using the objects defined in this plugin, an entire if structure can be quickly selected, for example."
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=3037"
license=("unknown")
depends=("vim>=7.0")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/michaeljsmith/vim-indent-object/tarball/${pkgver}")
sha256sums=("8fa0e3f117d666c28fe4ab7128096c056fe1cc2c3347e2d5da95eff92d96ca78")

package() {

    local vimfilesdir="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${vimfilesdir}"

    cd "${srcdir}/michaeljsmith-vim-indent-object-eb911bc/" || return 1

    cp -r * "${vimfilesdir}"

}
