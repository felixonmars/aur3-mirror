# Maintainer: kfgz <kfgz at interia pl>

pkgname=ramspeed-smp
pkgver=3.5.0
pkgrel=1
pkgdesc="CLI utility to measure cache and memory performance of computer systems. SMP version."
arch=('i686' 'x86_64')
url="http://alasir.com/software/ramspeed/"
license=('custom')
source=(http://kfgz.mydevil.net/ramsmp-${pkgver}.tar.gz)
md5sums=('c26b32c752c603e17c28a1cab4348682')

build() {
  cd ${srcdir}/ramsmp-${pkgver}
  sed -i "s/read ANS//g" build.sh
  if [ `uname -m` = "x86_64" ]; then
    ./build.sh Linux amd64
  else
    ./build.sh Linux i386
  fi
}

package() {
  cd ${srcdir}/ramsmp-${pkgver}
  install -m755 -D ramsmp ${pkgdir}/usr/bin/ramsmp
  install -m644 -D LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -m644 -D README ${pkgdir}/usr/share/doc/${pkgname}/README
}
