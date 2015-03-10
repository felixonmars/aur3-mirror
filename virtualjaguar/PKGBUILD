# Contributor: Vaino Helminen <vah78 yahoo com>
pkgname=virtualjaguar
pkgver=2.1.2
pkgrel=1
pkgdesc="A portable Atari Jaguar emulator"
arch=('i686' 'x86_64')
url="http://icculus.org/virtualjaguar/"
license=('GPL')
depends=('sdl' 'qt4')
conflicts=('virtualjaguar-git')
source=("http://icculus.org/virtualjaguar/tarballs/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0d2788d99ca33c94952428df93403353')

build() {
    cd "$pkgname"
    make -j1
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    cp virtualjaguar "$pkgdir/usr/bin"

    mkdir -p "$pkgdir/usr/share/applications"
    cp virtualjaguar.desktop "$pkgdir/usr/share/applications"
    echo 'icon=virtualjaguar' >> "$pkgdir/usr/share/applications/virtualjaguar.desktop"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    cp res/vj.xpm "$pkgdir/usr/share/pixmaps/virtualjaguar.xpm"
}
