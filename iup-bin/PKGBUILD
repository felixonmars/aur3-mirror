# Maintainer: Silvernode <hookahkitty@gmail.com>


pkgname=iup-bin
pkgver=3.7
pkgrel=1
pkgdesc="Cross platform GUI toolkit"
arch=('x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('custom:tecgraf_library')
depends=('gtk2' 'lua51' 'im-bin' 'cd-bin')
optdepends=('lua51: bindings for Lua are available'
            'cd: for additional controls support'
            'im: for advanced imaging support'
            'mesa: for OpenGL support')
    source=("http://superb-dca2.dl.sourceforge.net/project/iup/${pkgver}/Linux%20Libraries/iup-${pkgver}_Linux32_64_lib.tar.gz")
    md5sums=('62760d35409877b9c250876a5a5cfba0')


build() {
    mkdir $srcdir/iup
    tar xpvzf iup-${pkgver}_Linux32_64_lib.tar.gz -C $srcdir/iup
    cd $srcdir/iup
    sudo ./install
    sudo ./install_dev
    sudo ./config_lua_module
    
}
