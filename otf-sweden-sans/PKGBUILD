# Maintainer: Alexandru Bocioaca <alexandru[dot]bocioaca[at]gmail>

pkgname=otf-sweden-sans
pkgver=1
pkgrel=1
pkgdesc="A classic and timeless typeface that can be used in both digital and analogue formats. Always use it when communicating the image of Sweden."
arch=('any')
url="http://sweden.identitytool.com/buildingblocks/secondary-building-blocks-always-use#our-main-typeface"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=sweden-sans.install
source=("http://sweden.identitytool.com/wp-content/uploads/sites/5/sweden_sans_desktop_and_web.zip")
sha256sums=('0a81641bb2de57f332663faf70ed533206948e60ebdb3f636722ff013385198f')

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 "$srcdir/sweden_sans_desktop_and_web/"*.otf "$pkgdir/usr/share/fonts/OTF/"
}
