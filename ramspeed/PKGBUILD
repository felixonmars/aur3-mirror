# Maintainer: kfgz <kfgz at interia pl>

pkgname=ramspeed
pkgver=2.6.0
pkgrel=1
pkgdesc="CLI utility to measure cache and memory performance of computer systems"
arch=('i686' 'x86_64')
url="http://alasir.com/software/ramspeed/"
license=('custom')
#source=(http://www.alasir.com/software/${pkgname}/${pkgname}-${pkgver}.tar.gz)
source=(http://kfgz.mydevil.net/${pkgname}-${pkgver}.tar.gz)
md5sums=('546394131a1467a8651e0b8a218970c0')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i "s/read ANS//g" build.sh
  if [ `uname -m` = "x86_64" ]; then
    ./build.sh Linux amd64
  else
    ./build.sh Linux i386
  fi
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -m755 -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -m644 -D LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -m644 -D README ${pkgdir}/usr/share/doc/${pkgname}/README
}
