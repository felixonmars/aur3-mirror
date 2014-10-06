# Submitter: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=ttf-century
pkgver=1.0
pkgrel=1
pkgdesc="Century TrueType Font (.ttf)"
url="http://www.monotype.com/"
arch=(any)
depends=(fontconfig xorg-font-utils)
license=('custom')
source=("century.ttf"
	"LICENSE")
md5sums=('165b3175b1345c0eb8b4097f4d024455'
         '0a6d221f389967512095f6d5927d164a')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/century.ttf" "$pkgdir/usr/share/fonts/TTF/"
  install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/ttf-century/LICENSE"
}
