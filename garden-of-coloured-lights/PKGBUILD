# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=garden-of-coloured-lights
pkgver=1.0.8
pkgrel=1
pkgdesc="A musical shmup."
arch=('i686' 'x86_64')
url="http://www.allegro.cc/depot/GardenofColouredLights"
#url="http://garden.sourceforge.net/drupal/"  # spammed
license=('GPLv3')
depends=('allegro')
makedepends=('')
source=(http://downloads.sourceforge.net/project/garden/garden/$pkgver/garden-$pkgver.tar.gz)
md5sums=('42966f2c457d71a3ff0dd30522801ade')

build() {
    cd "$srcdir/garden-$pkgver"

    ./configure --prefix=/usr
    make
    make DESTDIR="$pkgdir" install 
}

