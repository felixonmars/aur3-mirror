# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=vavoom-textures
pkgver=1.0
pkgrel=2
pkgdesc="High-resolution textures for the Vavoom Doom engine port"
arch=('any')
url="http://forums.yaa.dk/viewtopic.php?f=32&t=69"
license=('unknown')
depends=('vavoom')
source=(http://downloads.sourceforge.net/vavoom/vtextures-doom-$pkgver.zip \
	http://downloads.sourceforge.net/vavoom/vtextures-doom1-$pkgver.zip \
	http://downloads.sourceforge.net/vavoom/vtextures-doom2-$pkgver.zip \
	http://downloads.sourceforge.net/vavoom/vtextures-heretic-$pkgver.zip \
	http://downloads.sourceforge.net/vavoom/vtextures-hexen-$pkgver.zip \
	http://downloads.sourceforge.net/vavoom/vtextures-strife-$pkgver.zip)
md5sums=('1591002bd654e16fef24808c18a28453'
         '34595ef781addcb79a3d5768a9249e7f'
         '1817bfdf98348b161d1dba367a731f46'
         'dba7993165285423fc62beb205652b31'
         'c6e63ca7033f86880b045ab0ad4904eb'
         'a7d9e49d8fd0a9c633f960a014cb61ca')

build() {
  mkdir -p "$pkgdir"/usr/share/vavoom
  cp -rf basev/ "$pkgdir"/usr/share/vavoom/

  find "$pkgdir" -type f -exec chmod 644 {} \;
}
