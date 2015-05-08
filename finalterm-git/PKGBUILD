# Maintainer : Valentin Hăloiu <vially.ichb+aur@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

_pkgname=finalterm
pkgname=${_pkgname}-git
pkgver=191.39b078b
pkgrel=1
pkgdesc="A new breed of terminal emulator"
arch=('x86_64' 'i686')
url="http://finalterm.org"
license=('GPL3')
depends=('clutter-gtk' 'desktop-file-utils' 'libgee' 'libkeybinder3' 'libnotify' 'mx')
makedepends=('cmake' 'git' 'intltool' 'vala')
provides=('finalterm')
conflicts=('finalterm')
source=("${pkgname}::git+https://github.com/p-e-w/${_pkgname}.git" "PR409.patch::https://github.com/joshslark/finalterm/commit/04697ea8632feb691238000c856f89f60cc0a612.patch")
sha1sums=('SKIP' '5e31d04378497bab14be9dd463e010d893d7e5cd')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "${srcdir}/${pkgname}"
    git apply --check ../PR409.patch && git apply ../PR409.patch
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/bin"
    mv "${pkgdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/bin"

    cat<<EOF > ${pkgdir}/usr/bin/${_pkgname}
#!/usr/bin/bash

CLUTTER_BACKEND=x11 /usr/share/${_pkgname}/bin/finalterm
EOF
    chmod a+x ${pkgdir}/usr/bin/${_pkgname}
}
