# Maintainer: Jochen Keil <jochen dot keil at gmail dot com>

_pkgname=path.py
_pkgprefix=python
pkgname=${_pkgprefix}-${_pkgname}-git
pkgver=20130402
pkgrel=1
pkgdesc="path.py implements a path objects as first-class entities, allowing common operations on files to be invoked on those path objects directly."
arch=('any')
url="https://github.com/jaraco/path.py.git"
license=('MIT')

provides=("${_pkgprefix}-${_pkgname}")
conflicts=("${_pkgprefix}-${_pkgname}")
replaces=('python-path')

_gitroot=git://github.com/jaraco/${_pkgname}.git
_gitname=$_pkgname

build() {
    cd "$srcdir"
    msg "Connecting to the GIT server..."
    if [[ -d $_gitname/.git ]]; then
        pushd $_gitname && git pull
        msg2 "The local files are updated."
        popd
    else
        git clone --depth 1 $_gitroot
    fi
    msg2 "GIT checkout done or server timeout"

    rm -rf $_gitname-build/
    cp -r $_gitname/ $_gitname-build/
    cd $_gitname-build/

    msg "Building..."
    python setup.py install --root="$pkgdir/" --optimize=1
}
