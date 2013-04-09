# Maintainer: Amr Hassan <amr.hassan@gmail.com>
pkgname=dbmaintain
pkgver=2.4
pkgrel=2
pkgdesc="DbMaintain enables automatic roll-out of updates to a relational database."
url="http://dbmaintain.org"
arch=('any')
license=('Apache')
depends=('java-runtime')
source=("http://garr.dl.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip"
		"dbmaintain.sh.patch")

md5sums=('d98149eaf1f72a7717e2d651d9a6ecfc'
         '000091c48f91d3d40c7c01bb3a78c478')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch dbmaintain.sh ../dbmaintain.sh.patch
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	install -Dm755 dbmaintain.sh ${pkgdir}/usr/bin/dbmaintain
	install -Dm644 ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm644 setJdbcDriver.sh ${pkgdir}/etc/dbmaintain.conf
}
