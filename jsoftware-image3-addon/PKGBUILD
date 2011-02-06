# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-image3-addon
pkgver=1.0.2
pkgrel=1
pkgdesc="addon to manage images in J programming language"
arch=('i686')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware')
source=(http://www.jsoftware.com/jal/j602/addons/media_image3_${pkgver}_linux.tar.gz)
md5sums=('2784b0256faf9b33cee2467a4287e1e2')
replaces=jsoftware-image-addon
build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a media $startdir/pkg/usr/lib/j/addons/
}
