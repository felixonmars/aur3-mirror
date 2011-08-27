pkgname=python-gensim-git
pkgver=20110221
pkgrel=1
pkgdesc="Python framework for fast Vector Space Modelling"
arch=('i686' 'x86_64')
url="http://nlp.fi.muni.cz/projekty/gensim/"
license=('LGPL')
depends=('python-scipy')
makedepends=('gcc' 'setuptools')
provides=('python-gensim')
conflicts=('python-gensim')
sources=()
md5sums=()

_gitroot="git://github.com/piskvorky/gensim.git"
_gitname="master"
#_gitname="develop"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
    msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
	cd $_gitname && git checkout $_gitname && cd -
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    git checkout $_gitname

    unset LDFLAGS
    unset FFLAGS

    # python2 fix
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done

    python2 setup.py test
    python2 setup.py build
    python2 setup.py install --prefix=/usr --root=${pkgdir}
    #install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt TODO: where to get license?
}
