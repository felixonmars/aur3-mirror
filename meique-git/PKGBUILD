# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=meique-git
pkgver=r358.13bbdf4
pkgrel=1
pkgdesc="Meique is a simple build system for C and C++ which uses Lua as scripting language."
arch=('i686' 'x86_64')
url="https://github.com/Meique/Meique"
license=('GPL')
depends=()
makedepends=('grep' 'sed' 'gcc' 'git')
source=("meique::git+${url}.git")
md5sums=("SKIP")
_gitname=meique

pkgver() {
    cd ${_gitname}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"
    cp -rf "${_gitname}" "${_gitname}-build"
    cd "${_gitname}-build"
    ./bootstrap.sh
}

package() {
    mkdir -p "${pkgdir}/usr/share/man/man1/"
    cd "${srcdir}/${_gitname}-build/build"
    mkdir -p "${pkgdir}"/usr/bin
    DESTDIR="${pkgdir}/usr" ./meique -i
}
