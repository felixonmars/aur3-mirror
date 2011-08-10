pkgname="jboss-web"
pkgver="2.1.9.GA"
pkgrel="1"
arch=('i686' 'x86_64')
pkgdesc="JBoss Web Server"
url="http://www.jboss.org/"
license="LGPL"
depends=('jdk')
optdepends=('tomcat-native')
makedepends=('tar' 'gzip')
source=("http://downloads.jboss.org/jbossweb/${pkgver}/jboss-web-${pkgver}.tar.gz" "jboss-web")
md5sums=('332c9a498c89a736d8c8826eff306fd1' '4c34a1a29ac815b20493402dc1f70990')

build() {
	mkdir -p ${startdir}/pkg/usr/share
	cd ${startdir}/pkg/usr/share
	mv ${startdir}/src/jboss-web-${pkgver} ${pkgname}
	rm -rf ${startdir}/pkg/usr/share/${pkgname}/bin/*.bat

	install -D -oroot -groot -m755 ${startdir}/jboss-web ${startdir}/pkg/etc/rc.d/jboss-web
}
