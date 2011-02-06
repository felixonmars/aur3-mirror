# Contributor: Tom < reztho at archlinux dot us >
pkgname=alfresco-community-tomcat-it
pkgver=3.3
pkgrel=1
pkgdesc="Alfresco Community Tomcat Language Pack. Italian."
arch=('any')
url="http://www.alfresco.com/"
license=('GPL')
depends=('alfresco-community-tomcat<3.4')
install=${pkgname}.install
source=('http://forge.alfresco.com/frs/download.php/424/it_language_pack_2.1.0_v1.0.tar.gz')

build() {
    cd ${srcdir}/it_language_pack_2.1.0_v1.0/
    bsdtar -xf ./langpack_it_IT-2.1.0_v1.0.jar

    mkdir -p ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/messages
    mv ${srcdir}/it_language_pack_2.1.0_v1.0/alfresco/messages/* \
    ${pkgdir}/opt/Alfresco/tomcat/shared/classes/alfresco/messages/

    # Correcting permissions...
    chown -R alfresco.alfresco ${pkgdir}/* || return 1
    find ${pkgdir}/* -type d -exec chmod 755 {} \; || return 1
    find ${pkgdir}/* -type f -exec chmod 644 {} \; || return 1
}

md5sums=('af71c83dd8d196faaf596d1e58dce36f')
