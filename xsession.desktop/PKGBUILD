# Maintainer: Jochen Keil <jochen dot keil at gmail dot com>
pkgname="xsession.desktop"
pkgver=0.0.1
pkgrel=2
# epoch=
pkgdesc="Run a custom ~/.xsession client script"
arch=('any')
url="http://www.example.com/"
license=('BSD')
# groups=()
# depends=()
# makedepends=()
# checkdepends=()
# optdepends=()
# provides=('xsession.desktop')
# conflicts=('xsession.desktop')
# replaces=('xsession.desktop')
# backup=()
# options=()
install=
changelog=
source=('xsession.desktop')
noextract=()
md5sums=('72eb4d909b16bbb7b6ecbba01b128284')

build() {
    : nothing to see here
}

check() {
    : nothing to see here
}

package() {
    cd "${srcdir}"
    install -D -m 0644 xsession.desktop "${pkgdir}"/usr/share/xsessions/xsession.desktop
}

# vim:set ts=4 sw=4 et:
