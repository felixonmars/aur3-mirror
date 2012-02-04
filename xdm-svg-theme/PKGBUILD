# Contributor: Ciriaco Garcia de Celis <cgarcia at etherpilot.com>
pkgname=xdm-svg-theme
pkgver=1.0
pkgrel=5
pkgdesc="xdm theme with SVG image, clock, halt and reboot buttons"
arch=(any)
url="http://bbs.archlinux.org/viewtopic.php?id=69299"
license=('GPL' 'CCPL')
depends=('xorg-xdm' 'xorg-sessreg' 'xorg-xrdb' 'xorg-xmessage' 'xorg-xsetroot' 'xorg-xrandr' 'xorg-xkill' 'xorg-xwininfo' 'xorg-xclock' 'imagemagick' 'librsvg')
makedepends=('tar')
provides=('xdm-svg-theme')
install=${pkgname}.install
source=("files.tar" "images.tar")
noextract=()
md5sums=('65db7b6ad6afccd46a513ae9d2d88a6f' 'baf0d94bc810d152423c70cf5e298d41')

build() {
    tar xf ${srcdir}/files.tar -C ${pkgdir}
    tar xf ${srcdir}/images.tar -C ${pkgdir}/usr/share/pixmaps/xdm-svg-theme
    echo "done"
}
