# Maintainer: Paweł 'kTT' Sałata <rockplayer.pl @ gmail at com>
pkgname=vim-git-branch-info
pkgver=20110112
pkgrel=1
pkgdesc="A Vim script to return info about the Git branches."
arch=(i686 x86_64)
url="http://github.com/taq/vim-git-branch-info"
license=('GPL')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')

_gitroot="git://github.com/taq/vim-git-branch-info.git"
_gitname="vim-git-branch-info"

build() {
    cd ${srcdir}

    msg "Connecting to GIT server..."

    if [ -d ${_gitname} ]; then
        cd ${_gitname} && git pull origin
        cd ..
        msg "The local files are updated."
    else
        git clone ${_gitroot}
    fi

    msg "GIT checkout done or server timeout"
    install -d ${pkgdir}/usr/share/vim/vimfiles/plugin/
    install -Dm755 ${srcdir}/vim-git-branch-info/plugin/git-branch-info.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
}

