# Contributor: Prurigro
# Contributor: DerFlob <derflob at derflob dot de>

_pkgname=tilda
pkgname=${_pkgname}-freerightclick-git
pkgver=20140808.r226.76161e7
pkgrel=1
pkgdesc="A GTK-based drop down terminal for Linux and Unix (patched to disable the right-click menu)"
arch=('i686' 'x86_64')
url="https://github.com/lanoxx/${_pkgname}"
license=('GPL')
depends=('vte3' 'confuse')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("git://github.com/lanoxx/${_pkgname}.git" "${_pkgname}-unassign-rightclick.patch")
sha512sums=('SKIP' 'f6c1e2124b37518edf298a5c8354ae5f7e13cfe21af9cf37edee03f3677cbe03e59d41cca3c2698fa3ea69e08ecc9500646fc166f270e29a629fe8ea18c51408')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
    patch -p1 < ../${_pkgname}-unassign-rightclick.patch
}

build() {
    cd $_pkgname
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd $_pkgname
    make DESTDIR="${pkgdir}/" install
    sed -i 's|applications/tilda.png|pixmaps/tilda.png|' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
