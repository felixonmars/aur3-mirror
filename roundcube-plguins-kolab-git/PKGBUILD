# $Id$
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=roundcube-plguins-kolab-git
_pkgname=roundcubemail-plugins-kolab
pkgver=3.1.2.657.gee02972
pkgrel=1
pkgdesc=('Kolab Plugins for the Roundcube Webmailer')
arch=('any')
url="http://www.kolab.org"
license=('GPL3')
depends=('roundcubemail')
conflicts=('roundcube-plugins-kolab')
source=("git+git://git.kolab.org/git/roundcubemail-plugins-kolab")
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g' | cut -f'4-' -d"."
}

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/roundcubemail
  cp -r "${srcdir}/${_pkgname}/plugins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

