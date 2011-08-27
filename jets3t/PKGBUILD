# Contributor: Christopher Heien <chris.h.heien@gmail.com>

pkgname=jets3t
pkgver=0.8.1
pkgrel=1
pkgdesc="Java library and front-end (cockpit) for accessing Amazon Simple Storage Service (Amazon S3)"
arch=('i686' 'x86_64')
url="http://bitbucket.org/jmurty/jets3t/wiki/Home"
license=('Apache 2')
depends=('java-runtime')
optdepends=('java-jce_policy: enables stronger encryption')
source=(http://bitbucket.org/jmurty/jets3t/downloads/${pkgname}-${pkgver}.zip jets3t.sh)
sha1sums=('0f5f4fa1ca899bc3d7efe32011809512a34c4205' 
	  'f2584ad40786a559d43729a1d4be01c480f1fc35')


build() {
  # create target directories
  install -dm755 ${pkgdir}/usr/share/java/${pkgname}
  install -dm755 ${pkgdir}/etc/profile.d
  install -dm755 ${pkgdir}/usr/bin

  # remote all non-linux executables
  rm $srcdir/${pkgname}-${pkgver}/bin/*.bat

  # install and link
  cp -Rp $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/java/$pkgname/
  install -m755 ${srcdir}/${pkgname}-${pkgver}/bin/cockpit.sh ${pkgdir}/usr/bin/cockpit
  install -m755 ${srcdir}/${pkgname}-${pkgver}/bin/cockpitlite.sh ${pkgdir}/usr/bin/cockpitlite
  install -m755 ${srcdir}/jets3t.sh ${pkgdir}/etc/profile.d/jets3t.sh
}

