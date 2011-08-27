# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-nova-theme
pkgver=20091215
pkgrel=1
pkgdesc="Nova OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php/Nova?content=60053"
license=('GPL')
depends=('openbox')
source=(http://opendesktop.org/CONTENT/content-files/60053-Nova-openbox.tar.gz)
md5sums=('6963f40bed7fa95fbc5b79c5d4f80419')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/themes/
  cp -rf "Nova/Nova-Blue" "Nova/Nova-Gold" "Nova/Nova-Lime" "Nova/Nova-Pink" ${pkgdir}/usr/share/themes/ || return 1
}
