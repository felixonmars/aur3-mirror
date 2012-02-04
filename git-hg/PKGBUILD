# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
#
# $Id$

pkgname=git-hg
pkgver=20110801
pkgrel=1
pkgdesc="git-hg plugin"
arch=(any)
url="https://github.com/offbytwo/git-hg"
license=('MIT')
depends=('mercurial' 'python-dulwich-git' 'git')
makedepends=()
provides=('git-fast-export')
source=('githghome.patch' 'python2.patch')
md5sums=('6ea17d66b7377655398557238f89c33a'
         'ad3a1e4ee5fc44d2e284a92babcc10bd')


_gitroot="https://github.com/offbytwo/git-hg.git"
_gitname=$pkgname

build() {
    if [ -d $_gitname ]
    then
        rm -rf $_gitname
    fi
    git clone $_gitroot $_gitname
    cd $_gitname
    git submodule update --init
    git apply ../githghome.patch
    git apply ../python2.patch
    mkdir -p ${pkgdir}/usr/share/git/
    mkdir -p ${pkgdir}/usr/lib/git-core/
    cp -r ${srcdir}/${_gitname}/fast-export ${pkgdir}/usr/share/git/
    install -m 755 ${srcdir}/${_gitname}/bin/git-hg ${pkgdir}/usr/lib/git-core/

    mkdir -m 755 -p ${pkgdir}/usr/bin
    install -D -m 755 ${srcdir}/${_gitname}/bin/* ${pkgdir}/usr/bin/

}
