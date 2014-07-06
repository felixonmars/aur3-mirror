# $Id$
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=roundcube-kolab
_pkgname=roundcubemail-plugins-kolab
pkgver=3.1.14
pkgrel=1
pkgdesc=('Kolab Plugins for the Roundcube Webmailer')
arch=('any')
url="http://www.kolab.org"
license=('GPL3')
depends=('roundcubemail')
source=("http://mirror.kolabsys.com/pub/releases/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('49246b5452c3b012c467c49f62823f4b19c4a4746eb87ea162d4a894329b9453f637235a63a356b25436b1de0479b8ab71bcac66c3c0613d039f21b643c3927c')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/roundcubemail
  cp -r ${srcdir}/${_pkgname}-${pkgver}/plugins ${pkgdir}/usr/share/webapps/roundcubemail/
}

