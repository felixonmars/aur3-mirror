# Contributor: Ciriaco Garcia de Celis <cgarcia at etherpilot.com>
pkgname=xcursor-human-aero
pkgver=1.0
pkgrel=1
pkgdesc="xcursor themes Human (Ubuntu) and Aero"
arch=(any)
url="https://launchpad.net/human-cursors-theme"
license=('CCPL')
depends=()
makedepends=('tar')
provides=('xcursor-human-aero')
install=
source=("human.tar" "aero.tar")
noextract=()
md5sums=('99a29de088c2cb82debeecc42e13644b' '11ab6fded0e62d0ff55416bbaad36e6e')

build() {
    tar xf ${srcdir}/human.tar -C ${pkgdir}
    tar xf ${srcdir}/aero.tar -C ${pkgdir}
    echo "done"
}
