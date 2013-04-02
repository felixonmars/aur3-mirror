# Maintainer: Jochen Keil <jochen dot keil at gmail dot com>

_pkgname=gitifyhg
_pkgprefix=python2
pkgname=${_pkgprefix}-${_pkgname}-git
pkgver=20130402
pkgrel=1
pkgdesc="git remote that allows local development and push changes to upstream mercurial"
arch=('any')
url="https://github.com/buchuki/gitifyhg"
license=('GPL')
depends=('python2' 'python2-path.py' 'mercurial')
makedepends=('python2-distribute')
provides=("${_pkgprefix}-${_pkgname}")
conflicts=("${_pkgprefix}-${_pkgname}")
replaces=("${_pkgprefix}-${_pkgname}")

_gitroot=git://github.com/buchuki/${_pkgname}.git
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
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
