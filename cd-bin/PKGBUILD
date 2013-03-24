# Maintainer: Silvernode <hookahkitty@gmail.com>


pkgname=cd-bin
pkgver=5.6
pkgrel=1
pkgdesc="A platform-independent graphics library"
arch=('x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('custom:tecgraf_library')
depends=('gtk2' 'lua51')
optdepends=('lua51: bindings for Lua are available'
            'cd-bin: for additional controls support'
            'iup-bin: for advanced imaging support'
            'mesa: for OpenGL support')
    source=("http://iweb.dl.sourceforge.net/project/canvasdraw/${pkgver}/Linux%20Libraries/cd-${pkgver}_Linux32_64_lib.tar.gz")
    md5sums=('136a30e86f3e0cc51a4571f11e87a416')


build() {
    mkdir $srcdir/cd
    tar xpvzf cd-5.6_Linux32_64_lib.tar.gz -C $srcdir/cd
    cd $srcdir/cd
    sudo ./install
    sudo ./install_dev
    sudo ./config_lua_module
    
}