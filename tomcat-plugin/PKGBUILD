# Maintainer:		osily <ly50247 at gmail dot com>

pkgname=tomcat-plugin
pkgver=3.3.0
pkgrel=1
pkgdesc="A eclipse plugin to use tomcat better."
arch=('any')
url="http://www.eclipsetotale.com/tomcatPlugin.html"
license=('GPL')
depends=('eclipse')
source=("http://www.eclipsetotale.com/tomcatPlugin/tomcatPluginV33.zip")
md5sums=('bf0198176fed07b39b61268e9217f457')

build() {
cd "${srcdir}/${_realname}"
install -d "${pkgdir}/usr/share/eclipse/plugins"
cp -r "${srcdir}/com.sysdeo.eclipse.tomcat_${pkgver}" "${pkgdir}/usr/share/eclipse/plugins"
}
