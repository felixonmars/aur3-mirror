# Maintainer: Oleh Prypin <blaxpirit at gmail dot com>

pkgname=sixcells
pkgver=2.1.1
pkgrel=1
pkgdesc="Level editor for Hexcells"
arch=('any')
url="https://github.com/BlaXpirit/sixcells"
license=('GPL3')
depends=('python'
         'python-pyside')
makedepends=()
optdepends=('python-pulp: Required for solving puzzles'
            'glpk: Faster solver for PuLP')
source=("https://github.com/BlaXpirit/sixcells/archive/v${pkgver}.tar.gz")
sha256sums=('9bbb68035e16f7e553d8b3eaabd097e6653c0a371070e99ec2547dacd1f2ee83')


package() {
    cd "${pkgdir}"
    
    mkdir -p "usr/lib"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "usr/lib/${pkgname}"
    
    mkdir -p "usr/bin"
    ln -s "/usr/lib/${pkgname}/editor.py" "usr/bin/sixcells-editor"
    ln -s "/usr/lib/${pkgname}/player.py" "usr/bin/sixcells-player"
}
