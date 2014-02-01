# Maintainer: Kirill Krasnoschekov <krvkir AT gmail DOT com>

pkgname=python-info
pkgver=20131122
pkgrel=1
pkgdesc="Texinfo file with Python docs"
arch=('any')
url="https://github.com/politza/python-info"
license=('GPL')
depends=('make' 'wget' 'python-sphinx' 'grep' 'sed' 'texinfo' 'tar') 
provides=('python-info')
install="INSTALL"

_fname=`python --version 2>&1 | tr 'P ' 'p-'`.info.gz

build() {
    local _repourl='https://raw.github.com/politza/python-info/master'

    cd ${srcdir}

    if [ ! -e "${srcdir}/${_fname}" ]; then
        rm -rf ${srcdir}/{Makefile,conf.py}
        msg "Fetching files from Politza repo"
        wget ${_repourl}/Makefile
        wget ${_repourl}/conf.py
        make
    fi
}

package() {
    cd ${srcdir}

    mkdir -p "${pkgdir}/usr/share/info/"
    install -m 644 ${_fname} "${pkgdir}/usr/share/info/"
}
