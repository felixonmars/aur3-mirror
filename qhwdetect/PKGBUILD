# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Giuseppe Cigala <g_cigala@virgilio.it>
 
pkgname=qhwdetect
pkgver=1.0
pkgrel=2
pkgdesc="Qt4 version of hwdetect" 
arch=('i686' 'x86_64')
url=http://qhwdetect.sourceforge.net/
license=('GPL') 
depends=('qt' 'hwdetect')
source=(http://www.webalice.it/giuseppe.cigala/$pkgname-$pkgver.tar.gz)
md5sums=('693fabbd0ca5ae3abbcffeed86958594')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  qmake || return 1
  make || return 1
  install -D -m 0755 bin/$pkgname ${pkgdir}/usr/bin/$pkgname	
}

