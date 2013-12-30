# Maintainer: Romain Schmitz <slopjong at archlinux dot lu>

pkgname=slock-spy
pkgver=1.1
pkgrel=1
pkgdesc="A simple screen locker for X with intrusion detection"
arch=('i686' 'x86_64')
url="https://github.com/slopjong/slock"
license=('MIT')
depends=('libxext' 'devil')
optdepends=('fswebcam')
provides=('slock')
replaces=('slock')
conflicts=('slock')
source=("slock-$pkgver.zip::https://github.com/slopjong/slock/archive/1.1-spy.zip")
md5sums=('11272a79c6efe3dc5cd7f5f506b66446')

build() {
  cd "$srcdir/slock-$pkgver-spy"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd ${srcdir}/slock-${pkgver}-spy
  make PREFIX=/usr DESTDIR=${pkgdir} install
  
  echo "#!/bin/bash" > ${pkgdir}/usr/bin/sslock
  echo "/usr/bin/slock -s" >> ${pkgdir}/usr/bin/sslock

  chmod 755 ${pkgdir}/usr/bin/sslock
  chmod u+s ${pkgdir}/usr/bin/sslock
  
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname/-spy}/LICENSE"
}
