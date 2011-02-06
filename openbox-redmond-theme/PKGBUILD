# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-redmond-theme
pkgver=20100307
pkgrel=1
pkgdesc="Windows 95/98/2000 inspirated OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/Redmond+2009?content=109595"
license=('GPL')
depends=('openbox')
optdepends=('gtk-theme-murrina-redmond: Windows 95/98/2000 GTK2 theme')
source=(http://opendesktop.org/CONTENT/content-files/109595-Redmond%202009.obt)
md5sums=('710d42cee07ad2f8c4aa47213e039254')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/*.obt ${pkgdir}/usr/share/themes/ || return 1
}
