# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Contributor: nightfrost <khashayar_naderehvandi@yahoo.co.uk>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=bluemote
pkgver=2.0
pkgrel=7
pkgdesc="Turn your Bluetooth-enabled mobile phone into a remote control for your computer"
arch=('i686' 'x86_64')
url="http://linux.softpedia.com/get/Utilities/Bluemote-12342.shtml"
license=("GPL")
depends=('libxtst')
source=("http://download.softpedia.ro/dl/797350dcea2611657fb5452be2536da0/4dc0fe73/500012342/linux/bluemote.2.0.tar.gz"
		"bluemote-lock.patch")
install=bluemote.install
md5sums=('69ab4eafb839a3f22fca2832fbba60f6' 'd515fa3209d3c18b6afd4243eb7625bb')

build () {
  cd ${srcdir}/bluemote
  make clean
  patch -p1 -i ../bluemote-lock.patch
  make
  }
package() {
	cd ${srcdir}/bluemote
  
  install -d ${pkgdir}/{usr/bin,etc/bluemote}
  install -m755 bluemote ${pkgdir}/usr/bin/bluemote
  install -m644 bluemote-example.cfg ${pkgdir}/etc/bluemote/bluemote.cfg
  install -m644 config.txt ${pkgdir}/etc/bluemote/config.txt
  
}
