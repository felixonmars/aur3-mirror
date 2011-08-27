# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=omvviewer-artwork
pkgver=1.22.11
pkgrel=1
pkgdesc="Artwork files for Open Metaverse Viewer"
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/index.shtml"
license=('custom')
conflicts=('omvviewer-artwork-git')
depends=()
source=("http://apt.byteme.org.uk/pool/main/o/${pkgname}/${pkgname}_${pkgver}+dfsg.orig.tar.gz")
makedepends=()
md5sums=('62c189c9c31ff29da132eaaac62720e6')

build() {
  cd ${srcdir}/linden/indra/newview

  mkdir -p ${pkgdir}/usr/share/omvviewer/ 
  cp -R * ${pkgdir}/usr/share/omvviewer/
}
