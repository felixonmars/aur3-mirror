# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=python-sphinx-breathe-git
pkgver=20120509
pkgrel=2
arch=('any')
url="https://github.com/michaeljones/breathe"
pkgdesc="Sphinx extension, a reST/Sphinx bridge to doxygen."
depends=('python2-sphinx' 'doxygen')
license=('BSD')
provides=("python-sphinx-breathe")
conflicts=("python-sphinx-breathe")

_gitroot=git://github.com/michaeljones/breathe.git
_gitname="${srcdir}/breathe"
_breathe_dir=$_gitname
_docpath=$pkgdir/usr/share/doc/python-sphinx-breathe  

build() {
    rm -rf "$_breathe_dir"
    git clone --depth=1 $_gitroot $_breathe_dir
    cd $_breathe_dir
    # change python2 interpreter
    find -type f -exec \
        sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
    # change sphinx-binaries name in source code
    find -type f -exec \
        sed -ri 's,(sphinx-(:?build|apidoc|autogen|quickstart)),\12,' {} \;
    python2 setup.py build --build-lib=build/python2
    make
}

package(){
    cd $_breathe_dir
    python2 setup.py build --build-lib=build/python2 \
        install --root="$pkgdir" --optimize=1
    # documentation
    mkdir -p $_docpath
    mv testsuite/build/html testsuite/source $_docpath

}
