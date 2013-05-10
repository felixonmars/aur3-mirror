# Maintainer: Michael Manley <mmanley@nasutek.com>
# Contributor: Phillip Smith <fukawi2@NOSPAM.gmail.com>
# Contributor: Dan Serban

pkgname=egroupware-core
_pkgname=egroupware
_pkgname_mm=eGroupware
pkgver=1.8.004.20130322
pkgver_mm=1.8
pkgrel=1
pkgdesc="Enterprise ready groupware software for your network. It enables you to manage contacts, appointments, todos and many more for your whole business."
arch=(any)
url=http://www.egroupware.org/
license=(GPL)
depends=(php)
source=("http://downloads.sourceforge.net/${pkgname}/${_pkgname_mm}-${pkgver_mm}/${_pkgname_mm}-${pkgver}/${_pkgname_mm}-${pkgver}.tar.gz"
	"http://downloads.sourceforge.net/${pkgname}/${_pkgname_mm}-${pkgver_mm}/${_pkgname_mm}-${pkgver}/${_pkgname_mm}-egw-pear-${pkgver}.tar.gz")
md5sums=('8f38e6eaf289cd8acbe969d5d6b6580b'
         '34cdd6c6e36b83855287236ca6c7ed2e')

package()
{
  _INSTDIR="${pkgdir}/srv/http/${pkgname}"
  _LIBDIR="${pkgdir}/srv/${pkgname}"
  # Install the server files
  mkdir -p $_INSTDIR
  cp -ra $srcdir/egroupware/* $_INSTDIR
  chown -R root:33 $_INSTDIR
  find $_INSTDIR -type d -exec chmod 775 {} \;
  find $_INSTDIR -type f -exec chmod 664 {} \;
  # Fix some defaults
  sed -i \
    -e 's|^/var/lib/egroupware/|/srv/egroupware/|g' \
    ${_INSTDIR}/setup/inc/class.setup_cmd_config.inc.php
  # Create lib directories
  mkdir -p $_LIBDIR/default/{files,backup}
  chown -R 33:33 $_LIBDIR
}
# vim:set ts=2 sw=2 et:
