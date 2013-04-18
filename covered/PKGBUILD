# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Ashok `ScriptDevil` Gautham <ScriptDevil at gmail dot com>
# Contributor: Laszlo Papp <djszapi2 at gmail dot com>

pkgname=covered
pkgver=0.7.10
pkgrel=1
pkgdesc="A Verilog code coverage analyzer"
arch=('i686' 'x86_64')
url="http://covered.sourceforge.net/"
license=('GPL')
depends=('zlib' 'gperf')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}-stable/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('7f79e93471546810b166e9104236bda2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
