# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=omvviewer-1-23-artwork
pkgver=1.23.1
pkgrel=1
pkgdesc="Artwork files for Open Metaverse Viewer"
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/index.shtml"
license=('custom')
source=("http://apt.byteme.org.uk/pool/main/o/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('a26d312885aa4ed03abe88e111e300db')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/indra/newview

  mkdir -p ${pkgdir}/usr/share/omvviewer-1-23/ 
  cp -R * ${pkgdir}/usr/share/omvviewer-1-23/
}
