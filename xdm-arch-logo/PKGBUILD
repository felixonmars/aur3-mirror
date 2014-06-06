# Based on xdm-arch-logo by Xappe & the_isz from archlinux.org forums
# Contributor: jwm-art
#               include systemd support, sanitize folder names
#               using xdm-archlinux package/directory structure
#               as template.

pkgname=xdm-arch-logo
pkgver=0.1
pkgrel=1
pkgdesc="An Arch Linux logo theme for xdm, with systemd support"
arch=("any")
url="https://github.com/jwm-art-net/xdm-arch-logo/"
license="GPL"
depends=("xorg-xdm" "xorg-xrandr" "xorg-xclock" "xorg-xwininfo" "xorg-xsetroot" "xorg-xkill" "librsvg")
makedepends=("tar" "gzip")
optdepends=("systemd-sysvcompat: if you use systemd"
            "xorg-xmessage: for reboot/halt buttons"
            "imagemagick: one option for setting the background image"
            "feh: another option for setting the background image"
            "xv: another option for setting the background image" )
source=(Xreset
        Xresources
        Xsetup
        Xstartup
        buttons
        xdm-arch-logo.install
        xdm-arch-logo.service
        xdm-config
        "http://upload.wikimedia.org/wikipedia/en/a/ac/Archlinux-official-fullcolour.svg" )

md5sums=('c9490faaa2c1b4f103f1a52aa9c3f102'
         'f598b90eb9e87b3f69b7c76e23241e9d'
         '46e269721fa888b14d681d0c76d39e30'
         '9ece51fe4063145979c6005fa1c1829e'
         'f9800662954fe3a641f233d5f5fce14b'
         '5157d43ab41b7843fc6821e8b863d7e8'
         '9dcca1e8d6ad7402759e90835946d52b'
         '07f9f67351411646c9291f54817b7011'
         'abc1cc75e716e05a7405071d79dfdf8c')

install=${pkgname}.install
package() {
  mkdir -p $pkgdir/etc/X11/xdm/${pkgname}
  cp buttons xdm-config Xresources Xsetup Xstartup Archlinux-official-fullcolour.svg $pkgdir/etc/X11/xdm/${pkgname}
  chmod 0755 $pkgdir/etc/X11/xdm/${pkgname}/{Xsetup,Xstartup,buttons}
  install -Dm0644 $srcdir/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
}
