# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=resin
pkgver=3.1.9
pkgrel=1
pkgdesc='High-performance, open source application server'
arch=('i686' 'x86_64')
url='http://caucho.com'
license=('GPL')
depends=('jdk>=6' 'apr' 'openssl' 'libtool')
backup=(etc/tomcat/server.xml etc/tomcat/context.xml etc/tomcat/tomcat-users.xml etc/tomcat/web.xml etc/tomcat/catalina.policy etc/conf.d/${pkgname}.conf)
install="${pkgname}.install"
source=(http://caucho.com/download/resin-${pkgver}-src.zip \
	http://caucho.com/download/resin-${pkgver}.tar.gz \
	#http://www.apache.org/dist/cxf/2.2/apache-cxf-2.2.tar.gz \
	#http://download.sourceforge.net/sourceforge/aopalliance/aopalliance.zip \
	resin.conf rc.${pkgname}.sh rc.${pkgname}.conf
)
noextract=(resin-${pkgver}.tar.gz)
_user_id=68

build() {
	[ -z "${JAVA_HOME}" ] && source /etc/profile.d/jdk.sh

	cd ${startdir}/src/resin-${pkgver} || return $?

	tar xf ../resin-${pkgver}.tar.gz -C .. resin-${pkgver}/lib/{activation.jar,javamail-141.jar,jaxws-api.jar,jsr88.jar}
	mkdir modules/ext
	mv lib/* modules/ext

	sed 's#\(<property name="javac.debug" value="\)[^"]*#\1off#' -i build.xml
	sed 's#\(<property name="javac.optimize" value="\)[^"]*#\1on#' -i build.xml
	sed 's#\(<property name="javac.source" value="\)[^"]*#\11.6#' -i build.xml
	sed 's#\(<property name="javac.target" value="\)[^"]*#\11.6#' -i build.xml
	sed '/<packageset dir="${promodules}\/pro\/src"\/>/d' -i build.xml

	ant compile doc configure || return $?

	./configure || return $?
	make || return $?

	mkdir -p ${startdir}/pkg/opt/resin
	mv lib ${startdir}/pkg/opt/resin/
	mkdir ${startdir}/pkg/opt/resin/libexec
	mv modules/c/src/resin_os/libresin_os.so ${startdir}/pkg/opt/resin/libexec

	mkdir -p ${startdir}/pkg/etc/resin
	mv conf/resin.conf ${startdir}/pkg/etc/resin/resin.conf.orig
	mv conf/app-default.xml ${startdir}/pkg/etc/resin/app-default.xml.orig
	ln -s /etc/resin ${startdir}/pkg/opt/resin/conf
	install -D -m0660 -g $_user_id ${startdir}/src/resin.conf ${startdir}/pkg/etc/resin/
	cp ${startdir}/pkg/etc/resin/app-default.xml.orig ${startdir}/pkg/etc/resin/app-default.xml
	chgrp -R $_user_id ${startdir}/pkg/etc/resin
	chmod 0660 ${startdir}/pkg/etc/resin/*

	mkdir -p ${startdir}/pkg/srv/webapps
	mv webapps/resin-doc.war ${startdir}/pkg/srv/webapps
	chown -R $_user_id:$_user_id ${startdir}/pkg/srv/webapps
	chmod 0775 ${startdir}/pkg/srv/webapps
	chmod 0664 ${startdir}/pkg/srv/webapps/*.war
	ln -s /srv/webapps ${startdir}/pkg/opt/resin/webapps

	mkdir -p ${startdir}/pkg/var/log/resin
	chown -R $_user_id:$_user_id ${startdir}/pkg/var/log/resin
	chmod 0775 ${startdir}/pkg/var/log/resin
	ln -s /var/log/resin ${startdir}/pkg/opt/resin/log

	mv php ${startdir}/pkg/opt/resin
	rm -r ${startdir}/pkg/opt/resin/php/quercus-war
	find ${startdir}/pkg/opt/resin/php -type f -exec chmod -x {} \;

	mv ext-webapp-lib ${startdir}/pkg/opt/resin
	mv plugins ${startdir}/pkg/opt/resin
	chmod -x ${startdir}/pkg/opt/resin/ext-webapp-lib/* ${startdir}/pkg/opt/resin/plugins/*

	install -D -m0754 -o $_user_id -g $_user_id ${startdir}/src/rc.${pkgname}.sh ${startdir}/pkg/etc/rc.d/${pkgname}
	install -D -m0664 -o $_user_id -g $_user_id ${startdir}/src/rc.${pkgname}.conf ${startdir}/pkg/etc/conf.d/${pkgname}
}
