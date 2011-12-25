# Maintainer: jarek <jarek @ eden.rutgers.edu>

pkgname=vim-neco-ghc
pkgver=20111225
pkgrel=1
pkgdesc='GHC support for Ultimate auto completion system for Vim'
arch=('i686' 'x86_64')
url='https://github.com/ujihisa/neco-ghc'
license=('GPL')
groups=('vim-plugins')
depends=('vim-neocomplcache')
makedepends=('git')

source=()
md5sums=()

_gitroot='https://github.com/ujihisa/neco-ghc.git'
_gitname='neco-ghc'

build() {
    cd "$srcdir"
    msg "Connecting to GIT server $_gitroot ..."
    if [ -d "$_gitname" ]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg 'GIT checkout done or server timeout'
    msg 'Start making ...'

    find ${srcdir}/$_gitname -name '*.vim' -exec chmod 755 {} \;

    install -d ${pkgdir}/usr/share/vim/vimfiles/autoload
    cp -r ${srcdir}/$_gitname/autoload/* ${pkgdir}/usr/share/vim/vimfiles/autoload/ || return 1
}
