# Maintainer: Andre Bartke <dev@bartke.cc>

pkgname=sentinel-ldk
pkgver=2.0
pkgrel=1
pkgdesc="Sentinel LDK runtime supporting Sentinel, Sentinel HL, HASP 4, and Hardlock keys"
arch=('i686')
url="http://www.safenet-inc.com/"
license=("custom")
depends=()
options=('!strip')
source=(
  "ftp://ftp.cis-app.com/pub/hasp/Sentinel_HASP/Runtime_(Drivers)/6.50/Sentinel_LDK_Ubuntu_DEB_Run-time_Installer.tar.gz"
  "license")

build() { 
  cd $srcdir/Sentinel_LDK_Ubuntu_DEB_Run-time_Installer
  
  msg "Extracting deb..."
  ar x *.deb

  rm -rf build
  mkdir build && cd build
  tar xvzf ../data.tar.gz
  mv etc/init.d etc/rc.d
}

package() {
  cp -a $srcdir/Sentinel_LDK_Ubuntu_DEB_Run-time_Installer/build/* $pkgdir
  install -Dm644 license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('b40b0e315199b8ddcd10a389b5f97887'
         'c9376f52c5385e507885db29c637200a')
# vim:set ts=2 sw=2 et:
