# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark-theme--dev-gnome3.6
pkgver=2.56
pkgrel=1
pkgdesc="Transitional package to delorean-dark-theme-3.6"
arch=('any')
url="http://fav.me/d5fslhj"
license=('GPL''Creative Commons NC SA')
depends=('delorean-dark-theme-3.6>=1.01')
source=("${pkgname}-${pkgver}.zip::http://www.deviantart.com/download/328859335/delorean_dark_2_55__development__gnome3_6_by_killhellokitty-d5fslhj.zip")
md5sums=('1e2adfcea5b1c6150658cd5833b6d1c4')


package() {
  # install themes
  find delorean-dark[development]/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
