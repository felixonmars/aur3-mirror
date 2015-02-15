# Maintainer: Martin Schulze <mail dot martin dot schulze at gmx dot net>
pkgname="templight-tools-git"
pkgver=rcd3828b
pkgrel=4
pkgdesc="Tools to work with Templight's trace files"
url="https://github.com/mikael-s-persson/templight-tools"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('boost-libs')
makedepends=('git' 'gcc>=4.8' 'boost')
optdepends=('templight2') 
provides=()
options=()

source=($pkgname::'git+https://github.com/mikael-s-persson/templight-tools.git')
md5sums=('SKIP')

pkgver(){
    cd "$srcdir/$pkgname"
    local _rev=`git rev-parse --short HEAD`
    printf "r%s" "$_rev"
}

build(){
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    local _targetdir="${pkgdir}/usr/bin/"
    mkdir -p "$_targetdir"
    cp "$srcdir/$pkgname/build/bin/templight-convert" "$_targetdir"
}
