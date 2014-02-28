# Maintainer: S. E. Durán <arambuladuransergio@gmail.com>

_pkgname=manjaro-fussion-icon-theme
pkgname=manjaro-fussion-icon-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="A faba inspired green icon theme for Manjaro Linux."
arch=('any')
url="http://sergioad.deviantart.com/art/manjaro-fussion-icon-theme-v1-0-RC-435665811"
license=('GPL3')
depends=(faenza-green-icon-theme faenza-icon-theme)
optdepends=()
provides=('Manjaro-Fussion')
source=('http://www.deviantart.com/download/435665811/manjaro_fussion_icon_theme_v1_0_rc_by_sergioad-d77dtw3.zip?token=efece5933234f67dee310b13ac16001b05a440e3&ts=1393469836')
md5sums=('SKIP')

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Manjaro-Fussion

  # install theme
  cd /tmp/
  sudo wget http://www.deviantart.com/download/435665811/manjaro_fussion_icon_theme_v1_0_rc_by_sergioad-d77dtw3.zip
  unzip /tmp/manjaro_fussion_icon_theme_v1_0_rc_by_sergioad-d77dtw3.zip
  cp -r /tmp/Manjaro-Fussion/ /usr/share/icons/
}

