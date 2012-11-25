# Maintainer: ValHue

pkgname=cinnamon-applet-titlebar
pkgver=1.3
pkgrel=1
pkgdesc="Displays the current window's title and icon in the panel. Goes well with the 'Cinnamon Window Buttons'."
arch=('i686' 'x86_64')
url="http://cinnamon-spices.linuxmint.com/applets/view/87"
license=('GPL3')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/Q8Y8-1TQN-LJIN.zip")
md5sums=('7375b758cdd83b6b2099c022356c9d0a')

package() {
    find titleBar\@errt -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
