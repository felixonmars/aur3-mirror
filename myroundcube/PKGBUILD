# $Id$
# Contributor: fila pruda.com

pkgname=myroundcube
pkgver=0.7.2.v1.0
pkgrel=2
pkgdesc="Plugins for Roundcube web-based mail client"
arch=('any')
url="http://myroundcube.googlecode.com"
license=('GPL')
depends=('roundcubemail>=0.7.2')
source=(http://myroundcube.googlecode.com/files/roundcube-0.7.2-bundle-v.1.0.zip)
md5sums=('7fa332ce791ce1899259ce80568597b6')

build() {
  _instdir=${pkgdir}/usr/share/webapps/roundcubemail
  install -dm755 ${_instdir}
  cp -r ${srcdir}/trunk/plugins ${_instdir}

  # fix all the 644 perms on files
  find ${_instdir} -type f -exec chmod 644 {} \;

  # some dirs need be rewritable
  chown http:http ${_instdir}/plugins/calendar/temp
  chown http:http ${_instdir}/plugins/captcha/temp



}
