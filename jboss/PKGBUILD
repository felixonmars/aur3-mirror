# Contributor: David Fuhr <david.fuhr@web.de>
#		Jaime Oyarzun Knittel <mito@archlinux.cl>
pkgname="jboss"
pkgver="5.1.0.GA"
pkgrel="1"
arch=('i686' 'x86_64')
pkgdesc="JBoss Application Server"
url="http://www.jboss.org/"
license="LGPL"
depends=('jdk')
makedepends=('unzip')
source=("http://downloads.sourceforge.net/sourceforge/jboss/jboss-${pkgver}.zip" "jboss" "jboss.sh")
md5sums=('78322c75ca0c13002a04418b4a8bc920' '86dc7564808180ebcb84f3a34f79a997'\
         '22ee64c38d8a5ed46c3434e8d81cf080')

build() {
	mkdir -p ${startdir}/pkg/opt
	cd ${startdir}/pkg/opt
	mv ${startdir}/src/jboss-${pkgver} ${pkgname}
	rm -rf ${startdir}/pkg/opt/jboss/bin/*.bat

	install -D -oroot -groot -m755 ${startdir}/jboss ${startdir}/pkg/etc/rc.d/jboss
	install -D -oroot -groot -m755 ${startdir}/jboss.sh ${startdir}/pkg/etc/profile.d/jboss.sh
}
