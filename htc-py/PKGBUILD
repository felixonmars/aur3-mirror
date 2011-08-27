#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=htc-py
pkgver=0.1.12
pkgrel=1
pkgdesc="XML data to HTML web-pages converter"
url="http://htc-py.sf.net"
arch=('i686' 'x86_64')
license=('GPL')
#depends=('python')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz" "htc")
md5sums=('840bd95be320e4749dbfd69ec6596ae0'
         'bb1b4dd6004450bbc8bb1353ccc7b1a9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/{bin,share/${pkgname}}
  install -Dm644 *.py ${pkgdir}/usr/share/${pkgname}/
  install -Dm755 ${srcdir}/htc ${pkgdir}/usr/bin/htc
}
