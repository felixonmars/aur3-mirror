# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=postr
pkgver=0.13
pkgrel=1
pkgdesc="GNOME Flickr Uploader"
arch=('any')
url="http://projects.gnome.org/postr/"
license=('GPL')
depends=('python2-gconf' 'python2-nautilus' 'twisted' 'hicolor-icon-theme' 'xdg-utils')
install="${pkgname}.install"
source=(
  "https://download.gnome.org/sources/postr/${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=(
  '3d5d4515892c8b81494257d7fc35d1c13a857bbdaf7b01ba67bde62ebddb962c'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  sed -i 's/#! \/usr\/bin\/env python/#!\/usr\/bin\/python2/' "${pkgdir}/usr/bin/postr" 
}
