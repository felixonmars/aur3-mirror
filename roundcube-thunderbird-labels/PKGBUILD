# Maintainer Stefan Tatschner <stefan@sevenbyte.org>

pkgname=roundcube-thunderbird-labels
_pkgname=thunderbird_labels
pkgver=1.0.0
pkgrel=1
pkgdesc="Allows managing sieve rules in roundcube"
arch=('any')
url="https://code.google.com/p/rcmail-thunderbird-labels/"
license=('GPL')
depends=('roundcubemail')
backup=("etc/webapps/roundcubemail/plugins/${_pkgname}/config.inc.php")
source=("${_pkgname}::svn+http://rcmail-thunderbird-labels.googlecode.com/svn/tags/${pkgver}")
md5sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
  mkdir -p "${pkgdir}/etc/webapps/roundcubemail/plugins/${_pkgname}"

  cd ${pkgdir}/usr/share/webapps/roundcubemail/plugins
  cp -ra "${srcdir}/${_pkgname}" "${_pkgname}"

  cd ${_pkgname}
  mv "config.inc.php" "${pkgdir}/etc/webapps/roundcubemail/plugins/${_pkgname}/config.inc.php"
  ln -s "/etc/webapps/roundcubemail/plugins/${_pkgname}/config.inc.php" config.inc.php
}
