# Maintainer: Alois Nešpor <info at aloisnespor.info>

pkgname=gtk-theme-lambda
pkgver=20120802
pkgrel=1
pkgdesc="GTK2/GTK3, Metacity, Unity and Xfwm4 theme. It's based upon the Zuktiwo theme with some slight mods. "
arch=('any')
url=("http://ponygon101.deviantart.com/art/Lambda-GTK-309035882")
license=('GPL2')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
source=(http://www.deviantart.com/download/309035882/lambda_gtk_by_ponygon101-d53zpm2.zip)


package () {
  install -dm755 "${pkgdir}/usr/share/themes"
  cp -Pr "${srcdir}"/lambda "${pkgdir}/usr/share/themes/lambda"

}
sha256sums=('e58287fae1353448fd1af9b9a41c5b11696bf2bdb21a6e8aa412b2300c75bca0')
