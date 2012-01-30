# Maintainer: n3lThon <n3lthon@sapo.pt>
# Submitter: d'Ronin <daronin@2600.com>
# Contributors: judfilm <jud@judfilm.net>

pkgname=freepbx
pkgver=2.10.0beta2
pkgrel=1
pkgdesc="Full-featured PBX web application for Asterisk"
url="http://www.freepbx.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('apache' 'asterisk' 'audiofile' 'bison' 'curl' 'lame' 'libtiff' 'libxml2' 'mysql' 'mysql-clients' 'ncurses' 'perl' 'php' 'php-apache' 'php-gd' 'php-pear' 'openssl' 'sox')
makedepends=('unixodbc')
optdepends=('postgresql' 'sqlite3')
install=${pkgname}.install
source=(http://mirror.freepbx.org/${pkgname}-${pkgver}.tar.gz install_amp)
md5sums=('f0a426942b8db13d8aa8b5ecc8fc601a' '8c227eb658a008031698d92117f7e930')

build() {
	install -D -d -m755 ${pkgdir}/usr/src/${pkgname}

	cp -r ${srcdir}/${pkgname}-${pkgver}/amp_conf ${pkgdir}/usr/src/${pkgname}/
	cp -r ${srcdir}/${pkgname}-${pkgver}/buildtools ${pkgdir}/usr/src/${pkgname}/
	cp -r ${srcdir}/${pkgname}-${pkgver}/SQL ${pkgdir}/usr/src/${pkgname}/
	cp -r ${srcdir}/${pkgname}-${pkgver}/upgrades ${pkgdir}/usr/src/${pkgname}/
	
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/amportal.conf ${pkgdir}/usr/src/${pkgname}/amportal.conf
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/apply_conf.sh ${pkgdir}/usr/src/${pkgname}/apply_conf.sh
	install -D -m755 ${srcdir}/install_amp ${pkgdir}/usr/src/${pkgname}/install_amp
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/libfreepbx.install.php ${pkgdir}/usr/src/${pkgname}/libfreepbx.install.php
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/setup_svn.php ${pkgdir}/usr/src/${pkgname}/setup_svn.php
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/start_asterisk ${pkgdir}/usr/src/${pkgname}/start_asterisk
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/update_i18n.sh ${pkgdir}/usr/src/${pkgname}/update_i18n.sh

	# INSTALL FreePBX INFO FILES
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/CHANGES ${pkgdir}/usr/share/doc/${pkgname}/CHANGES
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/CONTRIB.txt ${pkgdir}/usr/share/doc/${pkgname}/CONTRIB.txt
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/FAQ ${pkgdir}/usr/share/doc/${pkgname}/FAQ
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/sqlite.readme ${pkgdir}/usr/share/doc/${pkgname}/sqlite.readme
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/UPGRADE ${pkgdir}/usr/share/doc/${pkgname}/UPGRADE
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/docs/README.directory ${pkgdir}/usr/share/doc/${pkgname}/docs/README.directory

	# INSTALL LICENSE
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}