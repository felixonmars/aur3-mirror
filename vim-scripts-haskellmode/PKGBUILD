# Maintainer: Magnus Therning <magnus@therning.org>

pkgname=vim-scripts-haskellmode
pkgver=20101118
pkgrel=1
pkgdesc="Collection of plugins to aid Haskell programming in Vim."
arch=(i686 x86_64)
url="http://projects.haskell.org/haskellmode-vim/"
license=('custom:vim')
depends=('vim>=7.0' 'vim-scripts-mgr')
source=(http://projects.haskell.org/haskellmode-vim/vimfiles/haskellmode-${pkgver}.vba)
changelog=$pkgname.changelog

build() {
    wdir=${pkgdir}/usr/share/vim-scripts/haskellmode
    mkdir -p ${wdir}
    vim -c "set rtp=${wdir}" \
        -c "so %" -c 'q!' \
        haskellmode-${pkgver}.vba
    rm -f ${wdir}/.VimballRecord
    rm -f ${wdir}/doc/tags
}

sha256sums=('890c839e50eb413ad236adee019d0da374e0ae29978daecbb72e58cd6d6c5266')
