# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Sigitas Mazaliauskas <sigisnn@gmail.com>

pkgname=pdi2iso
pkgver=0.1
pkgrel=2
pkgdesc="A very simple utility to convert an instant copy bin image to the standard ISO-9660 format"
arch=('i686' 'x86_64')
url="http://developer.berlios.de/projects/pdi2iso/"
license=('GPL')
depends=('glibc')
source=(http://download.berlios.de/${pkgname}/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('32aba7602519c46588d7e771821840aa')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}-src
  make || return 1
  install -D -m755 ${pkgname} ${startdir}/pkg/usr/bin/${pkgname}
}
