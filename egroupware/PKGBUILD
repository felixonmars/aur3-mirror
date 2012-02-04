# Maintainer: Dan Serban
# Contributor: Phillip Smith <fukawi2@NOSPAM.gmail.com>

pkgname=egroupware
pkgver=1.8.001.20110216
pkgrel=1
pkgdesc="Enterprise ready groupware software for your network. It enables you to manage contacts, appointments, todos and many more for your whole business."
arch=(any)
url=http://www.egroupware.org/
license=(GPL)
depends=(apache php)
source=("http://downloads.sourceforge.net/${pkgname}/eGroupware-${pkgver}.tar.gz"
	"http://downloads.sourceforge.net/${pkgname}/eGroupware-egw-pear-${pkgver}.tar.gz"
	"http-egroupware.conf")
md5sums=('1ca2c722f552387869c271334c3dd19a'
         '35a11f813de81a2aaa204d9aa65d6647'
         '09bc9f01381ce9a2f013d17e996d6c7b')

build()
{
  _INSTDIR="${pkgdir}/srv/http/${pkgname}"
  _HTTPDIR="${pkgdir}/etc/httpd/conf/extra"
  _LIBDIR="${pkgdir}/srv/${pkgname}"
  # Install the server files
  mkdir -p $_INSTDIR
  cp -ra $srcdir/egroupware/* $_INSTDIR
  chown -R root:33 $_INSTDIR
  find $_INSTDIR -type d -exec chmod 775 {} \;
  find $_INSTDIR -type f -exec chmod 664 {} \;
  # Install the Apache config file
  install -Dm644 -o33 -g33 $srcdir/http-egroupware.conf $_HTTPDIR/httpd-egroupware.conf
  # Fix some defaults
  sed -i \
    -e 's|^/var/lib/egroupware/|/srv/egroupware/|g' \
    ${_INSTDIR}/setup/inc/class.setup_cmd_config.inc.php
  # Create lib directories
  mkdir -p $_LIBDIR/default/{files,backup}
  chown -R 33:33 $_LIBDIR
}
# vim:set ts=2 sw=2 et:
