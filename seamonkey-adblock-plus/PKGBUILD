# Mantainer: torto

pkgname=seamonkey-adblock-plus
pkgver=2.3.2
pkgrel=1
_pkgname=adblock_plus-$pkgver-tb+an+sm+fx
pkgdesc='Ads, banners and social plugins blocking based on blacklists'
arch=(any)
url='http://adblockplus.org'
license=(MPL)
depends=(seamonkey)
makedepends=(unzip)
source=(https://addons.mozilla.org/seamonkey/downloads/latest/1865/$_pkgname.xpi)
noextract=($_pkgname.xpi)
md5sums=('1d062796a5ff05d60f20a97677edd437')

package(){
  cd "$srcdir"
  _emid=$(unzip -p $_pkgname.xpi install.rdf |awk -F'<em:id>|</em:id>' '/<em:id>/ {print $2; exit}')
  _smver=$(pacman -Q seamonkey |cut -d\  -f2 | cut -f1 -d-)
  install -Dm644 $_pkgname.xpi "$pkgdir/usr/lib/seamonkey-$_smver/extensions/$_emid.xpi"
}

