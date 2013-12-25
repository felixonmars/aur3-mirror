# Maintainer: Kevin Klement = klement at philos dot umass dot edu
pkgname=jzintv
pkgver=1.0beta4
dashedpkgver=${pkgver//beta/-beta}
pkgrel=1
pkgdesc="Mattel Intellivision™ console emulator"
arch=('x86_64')
url="http://spatula-city.org/~im14u2c/intv/"
license=('GPL')
install=$pkgname.install
makedepends=('unzip')
source=(http://spatula-city.org/~im14u2c/intv/dl/${pkgname}-${dashedpkgver}-${CARCH}-linux.zip)
md5sums=('3d1c790bdd1d22ee6fa678f53dddd312')
noextract=(${pkgname}-${dashedpkgver}-${CARCH}-linux.zip)

build() {
  cd "${srcdir}"
  unzip "${pkgname}-${dashedpkgver}-${CARCH}-linux.zip"
}

package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cd "${srcdir}/${pkgname}-${dashedpkgver}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"
  mkdir -p $pkgdir/usr/bin
  cat >> $pkgdir/usr/bin/$pkgname << EOF
#!/bin/bash
/usr/share/${pkgname}/bin/${pkgname} -e /usr/share/${pkgname}/rom/exec.bin -g /usr/share/${pkgname}/rom/grom.bin -E /usr/share/${pkgname}/rom/ecs.bin \$@
exit \$?
EOF
  chmod a+x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
