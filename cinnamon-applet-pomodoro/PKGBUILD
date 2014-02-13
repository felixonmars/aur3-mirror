# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname=cinnamon-applet-pomodoro
pkgver=2.0
pkgrel=1
pkgdesc="A pomodoro timer."
arch=('i686' 'x86_64')
url="http://cinnamon-spices.linuxmint.com/applets/view/131"
license=('GPL3')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/QBI6-4ZOF-2B40.zip")
md5sums=('6f2d9c4f7495a31881037daef6d78f85')

_uuid="pomodoro@gregfreeman.org"

package() {
    find ${_uuid}/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/cinnamon/applets/{}" \;
}
