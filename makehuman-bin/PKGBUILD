#! /bin/bash
# Maintainer: Kyro <chris-bos-lee@hotmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=makehuman-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Parametrical modeling program for creating human bodies(binary package)"
arch=('any')
url="http://www.makehuman.org/"
depends=('python2-numpy' 'python2-pyqt4' 'python2-opengl')
license=('AGPL3')
source=("http://download.tuxfamily.org/makehuman/releases/${pkgver}/makehuman-${pkgver}_all.deb")
sha1sums=('d8e64c795ee39cfd345ba05bc6d159d363e3f7bd')
install=makehuman.install

package() {
 
  msg2 "extract deb"
  ar vx makehuman-"$pkgver"_all.deb
   
  msg2 "extract "$pkgname"..."
  tar jxf "${srcdir}"/data.tar.bz2 -C "${pkgdir}"/
  
  msg2 "edit py"
  sed -i 's/python/python2/g' "${pkgdir}"/usr/bin/makehuman
}
