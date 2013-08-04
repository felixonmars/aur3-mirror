# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=python-sphinx-breathe
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://github.com/michaeljones/breathe"
pkgdesc="Sphinx extension, a reST/Sphinx bridge to doxygen."
depends=('python2-sphinx' 'doxygen')
license=('BSD')
#_gitname="${srcdir}/breathe"
source=("breathe.zip::https://codeload.github.com/michaeljones/breathe/zip/v1.0.0")

build() {
    cd ${srcdir}/breathe-$pkgver
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
    cd ${srcdir}/breathe-$pkgver
    python2 setup.py build --build-lib=build/python2 \
        install --root="$pkgdir" --optimize=1
    # documentation
    mkdir -p $pkgdir/usr/share/doc/python-sphinx-breathe  
    mv testsuite/build/html testsuite/source \
       $pkgdir/usr/share/doc/python-sphinx-breathe  
}

md5sums=('66547c1bc5e717d98620d3fb8a1aee2a')
