# Contributor: Tom < reztho at archlinux dot us >
pkgname=alfresco-community-tomcat-fr
pkgver=3.3
pkgrel=1
pkgdesc="Alfresco Community Tomcat Language Pack. French."
arch=('any')
url="http://www.alfresco.com/"
license=('GPL')
depends=('alfresco-community-tomcat<3.4')
install=${pkgname}.install
source=('http://forge.alfresco.com/frs/download.php/883/Alfresco_3.2.0r.zip')

build() {
    mkdir -p ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/
    mv ${srcdir}/messages ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/
    mv ${srcdir}/web-extension ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/

    # Correcting permissions...
    chown -R alfresco.alfresco ${pkgdir}/* || return 1
    find ${pkgdir}/* -type d -exec chmod 755 {} \; || return 1
    find ${pkgdir}/* -type f -exec chmod 644 {} \; || return 1
}

md5sums=('805ceb97ac2eb1e38248ddba6d20a706')
