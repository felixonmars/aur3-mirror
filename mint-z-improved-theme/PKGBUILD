# Contributor: Ner0

pkgname=mint-z-improved-theme
pkgver=1.4.5
pkgrel=1
pkgdesc="An updated and slightly improved version of the default Linux Mint 12 theme"
arch=('any')
url="http://karashata.deviantart.com/art/Mint-Z-Improved-1-3-4-310624788"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
options=('!strip')
source=("http://www.deviantart.com/download/310624788/mint_z_improved__1_4_5__by_karashata-d54xrmc.zip")
md5sums=('74a16172fc867c8e3baf843990592803')

package() {
  find Mint-Z\ Improved -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}
