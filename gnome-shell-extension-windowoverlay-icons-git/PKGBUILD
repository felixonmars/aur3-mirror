# Maintainer: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=gnome-shell-extension-windowoverlay-icons-git
pkgver=49
pkgrel=4
pkgdesc="A GNOME Shell extension to add an icon to windows in the overview"
arch=('any')
url="https://github.com/sustmi/gnome-shell-extensions-sustmi"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname%-*}.install
source=("${pkgname%-*}::git+https://github.com/sustmi/gnome-shell-extensions-sustmi.git")
sha256sums=('SKIP')
_uuid=windowoverlay-icons@sustmidown.centrum.cz	

pkgver() {
    cd ${pkgname%-*}
    git rev-list --count HEAD
}

package() {
    cd ${pkgname%-*}
    mv windowoverlay-icons $_uuid
    for d in $(find ./$_uuid -type d)
    do
        mkdir -p $pkgdir/usr/share/gnome-shell/extensions/$d
    done

    for f in $(find ./$_uuid -type f)
    do
        install -m0644 $f $pkgdir/usr/share/gnome-shell/extensions/$f
    done
}

