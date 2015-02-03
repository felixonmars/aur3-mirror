# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Based on owncloud-git PKGBUILD by Alexander Ovsyannikov

pkgname=owncloud-beta
_pkgname=owncloud
pkgver=8.0.0RC1
pkgrel=1
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="http://owncloud.org/"
license=('GPL')
depends=('php-gd' 'php-intl')
optdepends=('php-apache: to use the Apache web server'
	    'php-sqlite: to use the SQLite database backend'
	    'php-pgsql: to use the PostgreSQL database backend'
	    'mariadb: to use the MySQL database backend'
	    'smbclient: to mount SAMBA shares'
	    'php-mcrypt'
	    'php-imagick: file preview'
	    'ffmpeg: file preview'
	    'libreoffice-common: file preview')
makedepends=()
options=('!strip')
source=("http://download.owncloud.org/community/testing/${_pkgname}-${pkgver}.tar.bz2"
	'apache.example.conf')
backup=('etc/webapps/owncloud/apache.example.conf')
sha512sums=('c04ee6699206e6fee7d04654d213c30e4a0a78609ae6b7c8521a0449b9d443e6b7062cf285a5fa5c74104b7ee0d41fe83e8b1c548df2cf3e72220f01096cd1af'
	    '3285576f012f73db7d4b3f7df88bf8533f9dc42645c2aaaf0af5af93daaeb52480b6c60422ab4927b2f36010aa02d4d13d7030ac8816b7d715e3435964b2a2f9')

package() {
  # install license
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/${_pkgname}/COPYING-* ${pkgdir}/usr/share/licenses/${pkgname}

  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${_pkgname} ${pkgdir}/usr/share/webapps/${pkgname}

  # install apache config file
  install -d  ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/${pkgname}

  # move config to /etc
  mv ${pkgdir}/usr/share/webapps/${pkgname}/config ${pkgdir}/etc/webapps/${pkgname}/config
  chown -R http:http ${pkgdir}/etc/webapps/${pkgname}/config
  ln -s /etc/webapps/${pkgname}/config ${pkgdir}/usr/share/webapps/${pkgname}/config
}
