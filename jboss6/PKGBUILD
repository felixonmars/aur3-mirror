# Maintainer: Guillaume ALAUX <Guillaume at alaux dot net>
pkgname=jboss6
pkgver=6.1.0.Final
pkgrel=1
pkgdesc="JBoss Application Server by RedHat"
arch=('i686' 'x86_64')
url='http://www.jboss.org/'
license=('LGPL')
depends=('java-environment')
makedepends=('java-environment')
source=(http://download.jboss.org/jbossas/6.1/${pkgname/6/}-as-distribution-${pkgver}.zip
        jboss6.rc.d
        jboss6.service.systemd)
sha256sums=('3426fda6b7066027437de76d02dd5418abc614aec3e21255f8aa704e56a1a291'
            '574ee988a07795cec6107e4c272b2058cdef136893a64b9761aed31cd3054004'
            '86b12aac3f428539126663428feda9892edcde6172426de809c5d276e9700089')

package() {
  cd "${srcdir}/jboss-${pkgver}"
  install -dm755 ${pkgdir}/usr/share
  cp -R ${srcdir}/jboss-${pkgver} ${pkgdir}/usr/share/${pkgname}
  rm -f ${pkgdir}/usr/share/${pkgname}/bin/*.{bat,exe}

  install -Dm755 ${srcdir}/jboss6.rc.d ${pkgdir}/etc/rc.d/jboss6
  install -Dm755 ${srcdir}/jboss6.service.systemd ${pkgdir}/lib/systemd/system/jboss6.service
}
