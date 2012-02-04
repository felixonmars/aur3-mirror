# Contributor: Christian Hesse <mail@earthworm.de>

pkgname=tp_smapi-builder
pkgver=0.40
pkgrel=2
pkgdesc="ThinkPad's SMAPI functionality drivers builder"
arch=('i686' 'x86_64')
url="http://tpctl.sourceforge.net/"
license=('GPL')
makedepends=('kernel26-headers')
install=tp_smapi-builder.install
source=(http://downloads.sourceforge.net/sourceforge/tpctl/tp_smapi-${pkgver}.tgz
        fix_for_2.6.37.patch
	tp_smapi
        tp_smapi.patch
	x120e.patch)

build() {
  cd ${srcdir}/tp_smapi-${pkgver}/
  patch -Np1 < "${srcdir}/tp_smapi.patch"
  patch -Np1 < "${srcdir}/fix_for_2.6.37.patch"
  patch -Np1 < "${srcdir}/x120e.patch"

  install -d -m 755 ${pkgdir}/usr/src/
  mv ${srcdir}/tp_smapi-${pkgver} ${pkgdir}/usr/src/tp_smapi
  install -D -m 755 ${srcdir}/tp_smapi ${pkgdir}/etc/rc.d/tp_smapi
}
md5sums=('f4eb8bb4d4413a5ae65aa7d77f4112c0'
         '80aa0a5b5a485551c1c9fae3083f110d'
         'ad6646cfe70ef2ce57f6ee89c8eef52c'
         '827536ee928638ffdab1975255f75fe3'
         '7029ae50fb1df190bb172fcbd17be1fa')
