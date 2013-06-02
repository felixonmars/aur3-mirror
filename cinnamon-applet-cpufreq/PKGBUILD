# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname=cinnamon-applet-cpufreq
pkgver=3.1
pkgrel=1
pkgdesc="A Cinnamon CPU Frequency Applet. Display and control cpu frequency."
url="http://cinnamon-spices.linuxmint.com/applets/view/70"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('cinnamon-applets')
depends=('cinnamon' 'gnome-applets')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/LORI-9DUX-5QKV.zip")
md5sums=('882df73357d5588fbb7f2043a553c22d')

_uuid="cpufreq@mtwebster"

package() {
    find ${_uuid}/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/cinnamon/applets/{}" \;
}
