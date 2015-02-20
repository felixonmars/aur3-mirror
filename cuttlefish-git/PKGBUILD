# Maintainer: Patrick Auernig <patrick.auernig@gmail.com>

pkgname=cuttlefish-git
pkgver=r21.0e13994
pkgrel=1
pkgdesc="Icon Previewer for KDE Plasma"
arch=('i686' 'x86_64')
url="http://vizzzion.org/blog/2015/02/say-hi-to-cuttlefish"
license=('GPL')
depends=("plasma-framework")
makedepends=('extra-cmake-modules'
             'cmake')
source=("cuttlefish::git+git://anongit.kde.org/scratch/sebas/cuttlefish")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/cuttlefish"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir"
    [[ -d build ]] && rm -rf build
    mkdir -p build
}

build() {
    cd "$srcdir/build"

    cmake "$srcdir/cuttlefish" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}

