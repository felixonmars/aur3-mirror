# Maintainer: Karol "Kenji Takahashi" Woźniak <wozniakk@gmail.com>

pkgname=qtiko
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple music player."
arch=('i686' 'x86_64')
url="https://launchpad.net/~baszczewski/+archive/qtiko"
license=('GPL2')
depends=('qt' 'taglib' 'phonon')
provides=('copyq')
source=(
"https://launchpad.net/~baszczewski/+archive/qtiko/+files/qtiko_0.1.2.orig.tar.gz"
"qtiko.sh"
)
md5sums=('2b8618b5c8cb142a6470e52b768ba980'
         '2c2a0465496d14ff51c4b449f6d47645')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    # fixes for gcc 4.7
    sed -i "53i#include <unistd.h>" solutions/singleapplication/core/qtlocalpeer.cpp
    sed -i "20i#include <unistd.h>" base/library_collection.cpp
    # fix for non-existing phonon.h
    perl -pi -e 's/<phonon>/<MediaObject>\n#include<AudioOutput>/g' base/player.h
    # fixes for... other things
    sed -i "26i#include <QModelIndex>" types/playlist.h
    sed -i "24i#include <QImage>" base/player.h
    # and make!
    qmake PREFIX="/usr" ${pkgname}.pro
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make INSTALL_ROOT="$pkgdir" install

    install -D -m755 "$srcdir/qtiko.sh" "$pkgdir/etc/profile.d/qtiko.sh"
}
