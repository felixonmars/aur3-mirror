# Contributor: Stephane A. Sezer <sas@cd80.net>

pkgname=vmfs-tools
pkgver=0.2.5
pkgrel=1
pkgdesc="A FUSE module for mounting VMFS filesystems"
arch=('i686' 'x86_64')
url="http://glandium.org/projects/vmfs-tools"
license=('GPL2')
depends=('fuse')
makedepends=('asciidoc')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5a50e1bc071939adb7a33e56369de652')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=${pkgdir}
  make
}

package() {
  make -C "${srcdir}/${pkgname}-${pkgver}" install
}
