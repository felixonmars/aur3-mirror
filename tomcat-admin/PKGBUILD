# Maintainer: Guillaume ALAUX <guillaume alaux.net>
pkgname=tomcat-admin
pkgver=5.5.33
pkgrel=1
pkgdesc="Tomcat 5.5 administration web application"
arch=('any')
url="http://tomcat.apache.org/"
license=('APACHE')
depends=('tomcat')
source=(http://archive.apache.org/dist/tomcat/tomcat-5/v${pkgver}/bin/apache-tomcat-${pkgver}-admin.tar.gz)
md5sums=('fc0a1844d766a1e359a4c07c0dcbee35')

package() {
	mkdir -p ${pkgdir}/opt/tomcat/{conf/Catalina/localhost,server/webapps}

	mv ${srcdir}/apache-tomcat-${pkgver}/server/webapps/admin \
		${pkgdir}/opt/tomcat/server/webapps

	mv ${srcdir}/apache-tomcat-${pkgver}/conf/Catalina/localhost/admin.xml \
		${pkgdir}/opt/tomcat/conf/Catalina/localhost

	chgrp 66 ${pkgdir}/opt/tomcat/conf/Catalina/localhost/admin.xml
	chmod 0660 ${pkgdir}/opt/tomcat/conf/Catalina/localhost/admin.xml
	chmod 0775 ${pkgdir}/opt/tomcat/conf
}
