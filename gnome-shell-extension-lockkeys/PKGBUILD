# Maintainer: kevin <kevin@archlinux.org>
pkgname=gnome-shell-extension-lockkeys
pkgver=0.1
pkgrel=1
pkgdesc="A lock key indicator for gnome-shell"
arch=('any')
url="http://kpiche.archlinux.ca/lock-keys"
license=('GPL3')
depends=('gnome-shell')
source=(http://kpiche.archlinux.ca/src/lockkeys-${pkgver}.tar.gz)
install=gnome-shell-extension-lockkeys.install

package() {
    cd "${srcdir}/lockkeys-${pkgver}/"
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/lockkeys@kpiche.gmail.com"
    cp "extension.js" "metadata.json" \
       "${pkgdir}/usr/share/gnome-shell/extensions/lockkeys@kpiche.gmail.com"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    cp "capslock-off.svg" \
       "${pkgdir}/usr/share/icons/hicolor/scalable/apps/capslock-off-symbolic.svg"
    cp "capslock-on.svg" \
       "${pkgdir}/usr/share/icons/hicolor/scalable/apps/capslock-on-symbolic.svg"
}
md5sums=('04c7fea5b3dfc8c63f9fe3695fa29ec0')
