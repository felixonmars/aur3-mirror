# Maintainer: Alex Reznichenko <sa5gap at yandex dot ru>

pkgname=libais

pkgver=20131015
pkgrel=1
pkgdesc="Library for decoding maritime Automatic Identification System messages"
arch=('i686' 'x86_64')
url="https://github.com/schwehr/libais"
license=('LGPL3')
depends=()
makedepends=('python2' 'python2-distribute' 'python2-pip' 'git')
options=(!emptydirs)
_gitname="libais"
_gitroot="git://github.com/schwehr/${_gitname}.git"

build() {
    cd ${startdir}/src

    if [[ -d ${startdir}/src/${_gitname} ]]; then
        cd ${_gitname}
        git pull origin || return 1
    else
        git clone ${_gitroot} || return 1
        cd ${_gitname}
    fi

    #~ cmake . || return 1
    #~ make || return 1
	pwd
    sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' *.py

	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
