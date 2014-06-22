# Maintainer: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=valkyrie
pkgver=2.0.0
pkgrel=4
pkgdesc="Graphical front-end to the Valgrind suite of tools"
arch=(i686 x86_64)
url="http://www.open-works.co.uk/projects/valkyrie.html"
license=('GPL2')
depends=('valgrind' 'qt4')
source=(http://www.valgrind.org/downloads/valkyrie-${pkgver}.tar.bz2
        vk_config.patch
        tool_object.h.patch
        vk_utils.cpp.patch)
md5sums=('a411dfb803f548dae5f988de0160aeb5'
         '3ce03e0694b6ffe03f102de643cc86a0'
         '9fe3f002c631d99230264ca65d2c6fc0'
         '0f0725f2ce30d503e99c3688d68b8221')
options=('strip' 'debug')

build(){
    cd $pkgname-$pkgver

    patch -p0 < ../vk_config.patch
    patch -p0 < ../tool_object.h.patch
    patch -p0 < ../vk_utils.cpp.patch
    qmake-qt4 PREFIX=/usr DOCDIR=/usr/share/doc
    make
}

package() {
    cd $pkgname-$pkgver

    make "DESTDIR=$pkgdir" "INSTALL_ROOT=$pkgdir" install
}
