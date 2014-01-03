# Maintainer: Martin Schulze <mail dot martin dot schulze at gmx dot net>
pkgname=templar-schulmar-git
pkgver=r5b6d4c2
pkgrel=1
pkgdesc="Updated version of Templar GUI to the Templight template Debugger"
url="https://github.com/schulmar/Templar"
arch=('i686' 'x86_64')
license=('unknown')
depends=('qt4' 'graphviz')
makedepends=('git' 'qt4' 'graphviz')
optdepends=('templight') 
provides=()
options=()

source=($pkgname::'git+https://github.com/schulmar/Templar.git')
md5sums=('SKIP')

pkgver(){
    cd "$srcdir/$pkgname"
    local _rev=`git rev-parse --short HEAD`
    printf "r%s" "$_rev"
}

build(){
    cd "$srcdir/$pkgname"
    local _MAKE_OPTS=""
    if [ ${MAKE_PARALLEL} ]; then
	$_MAKE_OPTS += "-j ${MAKE_PARALLEL}"
    fi
    qmake INCLUDEPATH+=/usr/include/graphviz
    make $_MAKE_OPTS
}

package() {
    local _targetdir="${pkgdir}/usr/bin/"
    mkdir -p "$_targetdir"
    cd "$srcdir/$pkgname" 
    cp "Templar" "$_targetdir"
}
