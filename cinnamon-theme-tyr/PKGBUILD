# Contributor: OmeGa <omega at mailoo dot org>
# Contributor: Jerome Lebleu <jerome dot lebleu at zoho dot com>

pkgname=cinnamon-theme-tyr
_file_jord=E5K9-V6GK-YNM8
_file_himinn=1WUJ-1BP4-H87A
pkgver=3.0
pkgrel=1
pkgdesc="A simple and sleek theme for Cinnamon in two variants."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/153"
license=('unknown')
depends=('cinnamon')
optdepends=('ttf-droid: Droid font family')
source=($pkgname-jord-$pkgver.zip::http://cinnamon-spices.linuxmint.com/uploads/themes/$_file_jord.zip
        $pkgname-himinn-$pkgver.zip::http://cinnamon-spices.linuxmint.com/uploads/themes/$_file_himinn.zip)
md5sums=('29897a1d9907d08aca02e24383616704'
         '1b70f954669b69177b533913dd3f4396')

package() {
  cd $srcdir
  find Tyr* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
