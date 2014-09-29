# Maintainer: Marvin Poul <ponder@creshal.de>
pkgname=brightnessicon-git
pkgver=r6.b2b6b1b
pkgrel=1
pkgdesc="Simple GTK tray icon to adjust backlight brightness."
arch=("any")
url="https://github.com/ponderstibbons/brightnessicon"
license=("GPL")
depends=("python-gobject" "gtk3" "xorg-xbacklight" "python")
makedepends=("git")
source=("git+https://github.com/ponderstibbons/brightnessicon.git")
md5sums=("SKIP")

pkgver() {
    cd ${pkgname/-git/}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    name=${pkgname/-git/}

    echo ${srcdir}
    echo ${pkgdir}

    cd ${srcdir}/${name}
    install -Dm755 ${name} ${pkgdir}/usr/bin/${name}
    install -Dm644 icon.svg ${pkgdir}/usr/share/${name}/icon.svg
}
