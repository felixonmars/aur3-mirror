# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=disk-indicator
pkgver=23
pkgrel=1
pkgdesc="Small program for Linux that will turn your Scroll, Caps or Num Lock LED into hard disk indicator."
url="https://github.com/MeanEYE/Disk-Indicator"
arch=('i686' 'x86_64' 'armv6h')   
makedepends=('subversion')
depends=('libx11')
license=('GPL3')
source=("Disk-Indicator::svn+https://github.com/MeanEYE/Disk-Indicator/trunk")
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/Disk-Indicator
  svnversion | tr -d [A-z]
}

build() {

  cd ${srcdir}/Disk-Indicator
  make all

}

package() {

  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/Disk-Indicator/disk_indicator ${pkgdir}/usr/bin/

}

