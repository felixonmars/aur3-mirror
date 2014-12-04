# Maintainer: Vitaliy Medvedev <vray.medvedev@gmail.com>

pkgname=netbeans-javaee
pkgver=8.0.2
_pkgbuild=201411181905
pkgrel=1
pkgdesc="Netbeans IDE development platform - JavaEE version"
arch=("any")
url="http://netbeans.org"
license=("CDDL")
depends=("java-environment" "libxtst" "giflib" "atk")
optdepends=('glassfish-v4.1: Provides a server for the development and deployment of Java EE and dynamic, scalable HTML5 applications.'
            'tomcat8: Open source web container for Java Servlet and JSP specifications.')
conflicts=("netbeans")
options=(!strip)
install=${pkgname}.install
source=(http://download.netbeans.org/netbeans/${pkgver}/final/zip/netbeans-${pkgver}-${_pkgbuild}-javaee.zip
        netbeans.desktop)
md5sums=('fde236d943d5f627de0bd965d43fdb8c'
         '28316412a8daeca3ccaf2dcc20429d6d')

prepare() {
	cd "${srcdir}"

	# Config
	sed -i "s|#netbeans_jdkhome=\"/path/to/jdk\"|netbeans_jdkhome=\"\$JAVA_HOME\"|g" netbeans/etc/netbeans.conf
}

package() {
	cd "${srcdir}"

	# Removals
	rm netbeans/bin/netbeans.exe

	# Directories
	install -d "${pkgdir}"/usr/share/netbeans "${pkgdir}"/usr/bin

	# Files
	cp -r netbeans/* "${pkgdir}"/usr/share/netbeans/
	ln -s /usr/share/netbeans/bin/netbeans "${pkgdir}"/usr/bin/netbeans

	# Desktop
	install -D -m644 "${startdir}"/netbeans.desktop "${pkgdir}"/usr/share/applications/netbeans.desktop
}
