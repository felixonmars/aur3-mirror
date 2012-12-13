# Maintainer: Lazaros Koromilas <koromilaz@gmail.com>

pkgname=exist
pkgver=1.4.2
_rev=rev16251
pkgrel=1
pkgdesc="An Open Source native XML database management system."
arch=('any')
url="http://exist.sourceforge.net/"
license=('LGPL3')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/${pkgname}/Stable/${pkgver}/eXist-setup-${pkgver}-${_rev}.jar"
	'exist'
	'exist.install'
	'exist.sh')
md5sums=('fd5523395510ba056de1e46fd13590cd'
         '6f052bf7ea9ad3ace16dcf1e2498ec1d'
         'b77850c13abfc1d0f420aef2a24cd6c3'
         'c85a8fb18649a9c8a69cc2fa563d4d08')
noextract=("eXist-setup-${pkgver}-${_rev}.jar")

build() {
	/bin/true
}

package() {
	cd ${srcdir}

	# install in opt
	install -dm755 ${pkgdir}/opt/exist/

	# use jar installer
	$JAVA_HOME/bin/java -jar eXist-setup-${pkgver}-${_rev}.jar \
	-p ${pkgdir}/opt/exist
	sed -i 's|EXIST_HOME=.*$|EXIST_HOME="/opt/exist"|' \
	${pkgdir}/opt/exist/bin/*.{sh,bat}
	sed -i 's|\${exist\.home}/webapp/WEB-INF/logs|/var/log/exist|' \
	${pkgdir}/opt/exist/log4j.xml
	install -dm777 ${pkgdir}/var/log/exist || return 1

	# add service
	install -dm755 ${pkgdir}/etc/rc.d || return 1
	install -dm755 ${pkgdir}/etc/profile.d || return 1
	install -Dm755 ${srcdir}/exist ${pkgdir}/etc/rc.d/
	install -Dm755 ${srcdir}/exist.sh ${pkgdir}/etc/profile.d/

	# have nicer names
	for script in ${pkgdir}/opt/exist/bin/*.sh
	do mv $script $(dirname $script)/exist$(basename $script .sh)
	done
}
