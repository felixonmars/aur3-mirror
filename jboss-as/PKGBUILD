# JBoss Application Server package
# Maintainer: Zdenek Obst <zdenek dot obst at gmail dot com>

pkgname=jboss-as
_majorver=7.1
pkgver=${_majorver}.1.Final
pkgrel=7

pkgdesc='Java EE 6 Application Server'
arch=('any')
url='http://www.jboss.org/jbossas'
license=('LGPL')
depends=('java-runtime>=6')

_pkgloc=usr/share
backup=(etc/profile.d/${pkgname}.sh
        ${_pkgloc}/${pkgname}/standalone/configuration/standalone.xml
        ${_pkgloc}/${pkgname}/standalone/configuration/mgmt-users.properties
        ${_pkgloc}/${pkgname}/standalone/configuration/logging.properties
        ${_pkgloc}/${pkgname}/domain/configuration/domain.xml
        ${_pkgloc}/${pkgname}/domain/configuration/mgmt-users.properties
        ${_pkgloc}/${pkgname}/domain/configuration/logging.properties
        ${_pkgloc}/${pkgname}/bin/standalone.conf
        ${_pkgloc}/${pkgname}/bin/domain.conf)
install=${pkgname}.install
source=(http://download.jboss.org/jbossas/${_majorver}/jboss-as-${pkgver}/jboss-as-${pkgver}.tar.gz
        ${pkgname}.service
        ${pkgname}.sh
        ${pkgname}.install
	systemd-wrapper.sh)
md5sums=('1e33096182ac7cac96089e39f7479b35'
         '7041e98670bc8d00489547f1425aa335'
         '292c086e418645b7d00ad49e885871c4'
         '031f8200d9c517412e1c330ae7792af1'
         'e5768fea6c7781150460bb8ffa6175d6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -f bin/*.{bat,exe}
  install -dm755 ${pkgdir}/${_pkgloc}
  cp -R ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/${_pkgloc}/${pkgname}

  # Prepare systemd service file
  install -Dm755 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

  # Prepare file for environment variables to profile.d
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh

  # Include wrapper script for systemd startup
  install -Dm755 ${srcdir}/systemd-wrapper.sh ${pkgdir}/${_pkgloc}/${pkgname}/bin/systemd-wrapper.sh
}
