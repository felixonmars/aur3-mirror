# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Patrick Kelly <kameo76890@gmail.com>

_pkgname=aws
pkgname=ada-web-server-git
pkgver=2.9.0.726.g2d0c1d2
pkgrel=1
pkgdesc="A complete, Ada-based, embeddable Web application framework"
arch=(i686 x86_64)
url=http://libre.adacore.com/tools/$_pkgname
license=(unknown)
groups=(gcc-ada)
depends=(gcc-ada)
makedepends=(git gprbuild)
provides=($_pkgname ada-web-server)
conflicts=($_pkgname ada-web-server)
source=(git+http://forge.open-do.org/anonscm/git/$_pkgname/$_pkgname.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname/
    git describe | sed 's/^v//;s/-/./g'
}

build() {
    make -C $_pkgname -j1 setup build
}

package() {
    make -C $_pkgname DESTDIR="$pkgdir" install
}
