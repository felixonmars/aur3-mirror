# Contributor: Emanuele Rampichini <emanuele.rampichini@gmail.com>

pkgname=mameexecutor
pkgver=1.01
pkgrel=1
pkgdesc="Powerful SDLMame-Frontend for KDE4 by Mindkiller Systems."
arch=('i686' 'x86_64')
url="http://mame.mindkiller.com/"
license=('GPL')
depends=('kdebase-runtime' 'sdlmame')
makedepends=('cmake' 'automoc4')
source=(http://mame.mindkiller.com/$pkgname-$pkgver.tar.gz)
md5sums=('7ceae3ae8dab1a0befb01a8a40b31774')

build() {
    mkdir $startdir/src/$pkgname-$pkgver/build
    cd $startdir/src/$pkgname-$pkgver/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DLINKS_FLAGS=RELEASE ../
    make VERBOSE=1 || return 1
    make DESTDIR=$startdir/pkg install || return 1
}