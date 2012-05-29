# Maintainer: ansgras
pkgname=cinnamon-applet-touchpad
pkgver=1.1
pkgrel=1
pkgdesc="Touchpad and Trackpoint management applet for Cinnamon."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/44"
license=('GPL')
depends=('cinnamon' 'xorg-xinput')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/9BNT-5QE9-P7VL.zip')
md5sums=('8c191d4196de89de3f2578bf12294034')

package() {
  find touchpad\@dalcde/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}

