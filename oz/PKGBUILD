# Maintainer: Roman Rader <antigluk@gmail.com>
pkgname=oz
pkgver=0.8.0
pkgrel=1
pkgdesc="Automated installation for guest images."
arch=('x86_64')
url="https://github.com/clalancette/oz"
license=('GPL')
depends=('libvirt')
makedepends=('rpmextract')
options=('')
source=("https://github.com/antigluk/oz-image-build/blob/master/packages/oz-0.8.0-0.20111219164530gita7249f9.fc15.noarch.rpm?raw=true")
md5sums=('73a6f41abbc3ff897a53835192d6ee08')

build() {
  cd "$pkgdir"
  rpmextract.sh ../../oz-0.8.0-*.noarch.rpm?raw=true
}