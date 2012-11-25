# Maintainer: Narendiran <a.narendiran@gmail.com>

pkgname=gtk-theme-malys-rought
pkgver=2.0
pkgrel=1
pkgdesc="GTK2/GTK3 Malys Rought Theme"
arch=('any')
url="http://malysss.deviantart.com/#/d5gxx4v"
license=('GPL3')
depends=('gtk-engine-unico' 'gtk-engines')
optdepends=()
source=("http://www.deviantart.com/download/337626780/malys___rought_by_malysss-d5l0iho.zip")
md5sums=('1b4f2360a1d0dd1b2b457568d62c4d1e')

package () {
  cd malys-theme\ GTK3-rought/malys-rought-bright-l/
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/malys-rought-bright-l/{}" \;
  rm -rf "$pkgdir/usr/share/themes/malys-rought-bright-l/backgrounds"
  cd ../../
  cd malys-theme\ GTK3-rought/malys-rought-bright-r/
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/malys-rought-bright-r/{}" \;
  rm -rf "$pkgdir/usr/share/themes/malys-rought-bright-r/backgrounds"
  cd ../../
  cd malys-theme\ GTK3-rought/malys-rought-dark-l/
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/malys-rought-dark-l/{}" \;
  rm -rf "$pkgdir/usr/share/themes/malys-rought-dark-l/backgrounds"
  cd ../../
    cd malys-theme\ GTK3-rought/malys-rought-dark-r/
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/malys-rought-dark-r/{}" \;
  rm -rf "$pkgdir/usr/share/themes/malys-rought-dark-r/backgrounds"
}
