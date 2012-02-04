# Maintainer: mjheagle <mjheagle8@gmail.com>
pkgname=vim-bufstat-git
pkgver=08202011
pkgrel=1
pkgdesc="buffer listing in status bar for vim"
url="https://github.com/rson/vim-bufstat/"
arch=('any')
license=('Custom')
depends=()
makedepends=('git')

_giturl="git://github.com/rson/vim-bufstat.git"
_gitname="vim-bufstat"

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server..."
    if [ -d ${_gitname} ]; then
        cd ${_gitname}
        #git pull origin
    else
        git clone ${_giturl} ${_gitname} --depth=1 
    fi
    msg "GIT checkout done or server timeout"
}

package() {
    cd "${srcdir}/${_gitname}/plugin"
    mkdir -p "${pkgdir}/usr/share/vim/vimfiles/plugin"
    cp -R ./ "${pkgdir}/usr/share/vim/vimfiles/plugin"
    cp -R ../doc "${pkgdir}/usr/share/vim/vimfiles/plugin"
    cd "${pkgdir}/usr/share/vim/vimfiles/plugin"
}
