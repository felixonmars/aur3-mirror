# Maintainer: Kosava <kosava@archlinux.us>

pkgname=pybtchat
pkgver=0.2.3
pkgrel=2
pkgdesc="pybtchat is a simple chat program (one to one) that uses bluetooth technology"
arch=('any') 
url="http://pybtchat.sourceforge.net/"
license=('GPL')
depends=('python-pybluez' 'python-notify' 'pygtk')
makedepends=('python2')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('aed4034943f4aea16731f48e5d9957c8')

build(){
  cd ${srcdir}/${pkgname}
  install -dm755 ${pkgdir}/usr/share/${pkgname}/{pics,xml}
  install -dm755 ${pkgdir}/usr/bin
  install -m644 xml/${pkgname}.xml ${pkgdir}/usr/share/${pkgname}/xml
  install -m644 pics/icon.png ${pkgdir}/usr/share/${pkgname}/pics
  install -m644 ${pkgname}.py ${pkgdir}/usr/share/${pkgname}
 
  #install wrapper
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "cd /usr/share/${pkgname}" >> ${pkgdir}/usr/bin/${pkgname}
  echo "python2 ${pkgname}.py" >> ${pkgdir}/usr/bin/${pkgname}
  chmod 755 ${pkgdir}/usr/bin/${pkgname}
}