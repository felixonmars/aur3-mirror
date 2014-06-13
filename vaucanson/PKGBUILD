# Maintainer: Akim Demaille <akim@lrde.epita.fr>
# Contributor: Akim Demaille <akim@lrde.epita.fr>

pkgname=vaucanson
pkgver=2014_0.1
pkgrel=1
pkgdesc="Vaucanson"
arch=('i686' 'x86_64')
url="https://www.lrde.epita.fr/wiki/Vaucanson"
license=('GPLv3')
provides=('vaucanson')
depends=('gcc' 'boost' 'ccache' 'libtool' 'python' 'flex' 'bison')
makedepends=('git' 'autoconf' 'automake' 'make')
source=("git+https://gitlab.lrde.epita.fr/vcsn/vaucanson.git")
sha512sums=(SKIP)

build() {
    cd vaucanson
    ./bootstrap
    ./configure -C CXX="ccache g++" CXXFLAGS="-O3" --prefix=/usr
    make
}

package() {
    cd vaucanson
    make install
}

