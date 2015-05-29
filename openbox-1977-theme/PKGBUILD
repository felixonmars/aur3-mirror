# Contributor: Flow

pkgname=openbox-1977-theme
pkgver=20091215
pkgrel=3
pkgdesc="1977 OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/1977+Openbox?content=69196"
license=('GPL')
depends=('openbox')
source=(http://opendesktop.org/CONTENT/content-files/69196-1977-openbox.obt)
md5sums=('311144f6e9829c4c82426260b90e97b4')

packages() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/1977-* ${pkgdir}/usr/share/themes/ 
}
