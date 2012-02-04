pkgname=jboss7
pkgver=7.0.1.Final
pkgrel=0.0.1.1
pkgdesc="JBoss Application Server by RedHat"
arch=('i686' 'x86_64')
url="http://www.jboss.org/"
license=('LGPL')
depends=('java-environment')
makedepends=('java-environment>=6')
provides=('jboss=7.0.1')
backup=(etc/profile.d/jboss7.sh
        usr/share/${pkgname}/standalone/configuration/standalone.xml
        usr/share/${pkgname}/standalone/configuration/mgmt-users.properties
        usr/share/${pkgname}/standalone/configuration/logging.properties
        usr/share/${pkgname}/domain/configuration/domain.xml
        usr/share/${pkgname}/domain/configuration/mgmt-users.properties
        usr/share/${pkgname}/domain/configuration/logging.properties
        usr/share/${pkgname}/bin/standalone.conf
        usr/share/${pkgname}/bin/domain.conf)

install=jboss7.install
source=(http://download.jboss.org/jbossas/7.0/jboss-as-${pkgver}/jboss-as-${pkgver}.tar.gz
        jboss7.sh
        jboss7
        jboss7.install)
md5sums=('0f25ab4e936de94780dba1e3a6d2da60'
         '97166fcfc81d47e5198af01c6ef6a15b'
         '96a7cafaec996cba29d7f21705009617'
         'c9258cd96a17607311557c82df4416b6')

package() {
  cd "${srcdir}/jboss-as-${pkgver}"
  rm -f bin/*.{bat,exe}
  install -dm755 ${pkgdir}/usr/share
  cp -R ${srcdir}/jboss-as-${pkgver} ${pkgdir}/usr/share/${pkgname}

  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/etc/rc.d/${pkgname}
}
