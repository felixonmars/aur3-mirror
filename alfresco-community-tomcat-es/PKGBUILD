# Contributor: Tom < reztho at archlinux dot us >
pkgname=alfresco-community-tomcat-es
pkgver=3.3
pkgrel=1
pkgdesc="Alfresco Community Tomcat Language Pack. Spanish."
arch=('any')
url="http://www.alfresco.com/"
license=('GPL')
depends=('alfresco-community-tomcat<3.4')
install=${pkgname}.install
source=('http://forge.alfresco.com/frs/download.php/828/es_ES_Spanish_language_pack.zip')

build() {
    mkdir -p ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/messages
    mv ${srcdir}/es_ES_traducidos/* ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/messages/

    # Correcting permissions...
    chown -R alfresco.alfresco ${pkgdir}/* || return 1
    find ${pkgdir}/* -type d -exec chmod 755 {} \; || return 1
    find ${pkgdir}/* -type f -exec chmod 644 {} \; || return 1
}

md5sums=('466960c410261e7b1d7f993f7b389e6e')
