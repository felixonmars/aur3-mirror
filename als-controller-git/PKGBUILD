# Maintainer: Teo Mrnjavac <teo@kde.org>

_pkgname=als-controller
pkgname=${_pkgname}-git
pkgver=20140521
pkgrel=1
pkgdesc="ASUS Zenbook ambient light sensor userspace controller."
arch=('i686' 'x86_64')
url="https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller"
license=('Apache')
depends=('qt5-base' 'libbsd' 'xorg-xbacklight')
makedepends=('git' 'als-driver-git')
provides=('als-controller')
conflicts=('als-controller')
source=("${_pkgname}::git+https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller.git")
sha512sums=('SKIP')

prepare() {
    cd ${_pkgname}/example
    sed -i 's|/bin/bash|/usr/bin/env bash|;s|"\$DIR"/\.\./service/||' switch.sh
}

build() {
    cd ${_pkgname}/service
    [[ "$CARCH" = "x86_64" ]] \
        && qmake als-controller.pro -r -spec linux-g++-64 \
        || qmake als-controller.pro -r -spec linux-g++
    make
}

package() {
    cd $_pkgname
    install -Dm644 example/images/active.svg "$pkgdir"/usr/share/als-controller/example/images/active.svg
    install -Dm644 example/images/inactive.svg "$pkgdir"/usr/share/als-controller/example/images/inactive.svg
    install -Dm755 example/switch.sh "$pkgdir"/usr/share/als-controller/example/switch.sh
    install -Dm755 service/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
