#Contributor: Justin Wong <bigeagle(at)xdlinux(dot)info>
pkgname=fcitx-keyboard
pkgver=0.1.3
pkgrel=1
pkgdesc="X Keyboard Integration wtih Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-keyboard"
license=('GPL')
depends=('fcitx>=4.2.3')
conflicts=('fcitx-keyboard-git')
makedepends=('cmake' 'intltool')
source=(http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz)

build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    rm -rf build
    mkdir build
    cd build
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package ()
{
    cd "$srcdir/${pkgname}-${pkgver}/build"
    make DESTDIR=${pkgdir} install
}
md5sums=('bd0acdad61a4f94ed35fe425ec0efee1')
