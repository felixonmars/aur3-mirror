# Contributor: CtHx

pkgname=eduke32-polymer-hrp
pkgver=5.1.302
pkgrel=1
pkgdesc="High-resolution textures and 3D models for EDuke32 (Polymer HRP)"
arch=('any')
url="http://hrp.duke4.net/"
license=('HRP Art' 'CGTextures')
depends=('eduke32>=20110314')
conflicts=('eduke32-hrp')
source=("http://www.duke4.org/files/nightfright/polymer/polymer_hrp.zip" \
	"http://www.duke4.org/files/nightfright/polymer/polymer_upd.zip" \
	"CGTextures.license" )

md5sums=('93059bc871eeb43e776e20d0cc2bcebb'
         'c36968ecd4d3e423d7d9a243f85cf805'
         '82167693ec2467aa5fa5c418a4a5f207')
         
         
conflicts=('eduke32-hrp')

build() {

  mkdir -p "$pkgdir"/usr/share/eduke32
  cp -rf *.def *.mhk highres/ highpal/ "$pkgdir"/usr/share/eduke32/

  find "$pkgdir" -type f -exec chmod 644 {} \;

  install -Dm644 hrp_art_license.txt "$pkgdir"/usr/share/licenses/$pkgname/hrp_art_license.txt
  install -m644 CGTextures.license "$pkgdir"/usr/share/licenses/$pkgname/
}


