pkgname=inescapable
pkgver="1.1"
pkgrel=1
license=('Commercial')
url="http://www.magneticrealms.com/"
pkgdesc="Unravel the mystery uncovered by a remote interplanetary mining operation."
arch=('x86_64')
_archive='inescapable_linux_1.1-amd64.deb'
source=("hib://${_archive}")
md5sums=('7bb8c6194dccac5a476bb288f3ae0f67')

build() {
    ar -xv ${_archive}
    tar xvf data.tar.gz
}

package() {
    install -D -m0755 "${srcdir}/usr/bin/inescapable" "${pkgdir}/usr/bin/inescapable"
    install -D -m0755 "${srcdir}/usr/bin/inescapable.bin" "${pkgdir}/usr/bin/inescapable.bin"
    install -D -m0644 "${srcdir}/usr/share/icons/hicolor/48x48/apps/inescapable.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/inescapable.png"
    install -D "${srcdir}/usr/share/inescapable/game0.dat" "${pkgdir}/usr/share/inescapable/game0.dat"
    install -D "${srcdir}/usr/share/inescapable/game1.dat" "${pkgdir}/usr/share/inescapable/game1.dat"
    install -D "${srcdir}/usr/share/applications/inescapable.desktop" "${pkgdir}/usr/share/applications/inescapable.desktop"
    install -D "${srcdir}/usr/share/doc/inescapable/README" "${pkgdir}/usr/share/doc/inescapable/README"
    install -D "${srcdir}/usr/share/doc/inescapable/LICENSE" "${pkgdir}/usr/share/doc/inescapable/LICENSE"
}
