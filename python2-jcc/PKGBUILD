# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Tomoya Kose <mitsuset@gmail.com>

pkgname=python2-jcc
pkgver=2.17
pkgrel=1
pkgdesc="a C++ code generator for calling Java from C++/Python"
arch=(i686 x86_64)
url=http://pypi.python.org/pypi/JCC
license=(Apache)
depends=(java-environment python2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/J/JCC/JCC-$pkgver.tar.gz)
sha256sums=('6c20c953726a2e28d13b6341ff4c93fc222dde31f1db5aa5e68116f1fb8112b7')
sha512sums=('fc2b1bf6cad203c2b86317cf081c9ef12a79c46910160db65953cdbd506d3fa9264ef449ec05571e4879fe037e0d32cd21bde1ee1783983287289518954b68b6')

prepare() {
    cd JCC-$pkgver/jcc/
    mv __main__.py save
    echo '#!/usr/bin/env python2' | cat - save > __main__.py
    rm save
}

build() { 
    export JCC_JDK=$JAVA_HOME
    cd JCC-$pkgver/
    python2 setup.py build
}

package() {
    cd JCC-$pkgver/
    python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

    cd "$pkgdir"/usr/
    install -d bin/
    local _bin=lib/python2.7/site-packages/jcc/__main__.py
    chmod +x $_bin
    ln -s /usr/$_bin bin/jcc
}
