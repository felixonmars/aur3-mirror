# Maintainer: Ecmel Ercan <ecmel dot ercan at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
pkgname=jetty8
pkgver=8.1.7.v20120910
pkgrel=1
pkgdesc='A HTTP server and Java Servlet container'
url='http://www.eclipse.org/jetty/'
arch=('any')
license=('Apache' 'EPL')
depends=(java-runtime)
conflicts=(jetty jetty6 jetty7)
options=(!strip !zipman)
install=jetty.install
backup=(etc/jetty.conf etc/default/jetty)
source=(http://download.eclipse.org/jetty/${pkgver}/dist/jetty-distribution-${pkgver}.tar.gz
        jetty.default
        jetty.logrotate
        jetty.rc
        jetty.service)
md5sums=('ca8e8a4b3511a3451f284f4092046367'
         'ec205df04b300409a0dd594ca32bd55b'
         '3234a6deed7e0583440318a69a35eff8'
         'bc45525437e550631e8a2c2eb6489e6e'
         'b9ae9033b7759724093ca10f776c19c7')

package() {
  cd ${srcdir}/jetty-distribution-${pkgver}

  sed -i 's:./logs:/var/log/jetty:' etc/*.xml
  sed -i 's:su - :su -s /bin/sh - :' bin/jetty.sh
  sed -i 's:etc/:/etc/jetty/:g' start.ini

  install -dm755 ${pkgdir}/var/lib/jetty
  install -dm755 ${pkgdir}/var/log/jetty
  
  pkghome=${pkgdir}/usr/share/java/jetty 
  for i in $(find lib -type d); do install -dm755 ${pkghome}/$i; done
  for i in $(find lib -type f -not -name '.*'); do 
    install -m644 $i ${pkghome}/$i
  done
  install -m644 start.jar ${pkghome}/start.jar
  install -Dm644 start.ini ${pkgdir}/etc/jetty.conf
  install -Dm755 bin/jetty.sh ${pkgdir}/usr/bin/jetty
  install -dm755 ${pkgdir}/etc/jetty
  install -m644 etc/* ${pkgdir}/etc/jetty
 
  dirs='contexts contexts-available overlays resources webapps'
  for i in $(find ${dirs} -type d); do 
    install -dm755 ${pkgdir}/var/lib/jetty/$i
  done
  for i in $(find ${dirs} -type f -not -name '.*'); do
    install -m644 $i ${pkgdir}/var/lib/jetty/$i
  done
 
  install -Dm644 ${srcdir}/jetty.default ${pkgdir}/etc/default/jetty
  install -Dm644 ${srcdir}/jetty.logrotate ${pkgdir}/etc/logrotate.d/jetty
  install -Dm755 ${srcdir}/jetty.rc ${pkgdir}/etc/rc.d/jetty
  install -Dm644 ${srcdir}/jetty.service ${pkgdir}/usr/lib/systemd/system/jetty.service

  ln -s /etc/jetty ${pkgdir}/var/lib/jetty/etc
  ln -s /usr/share/java/jetty/lib ${pkgdir}/var/lib/jetty/lib
  ln -s /usr/share/java/jetty/start.jar ${pkgdir}/var/lib/jetty/start.jar
}

