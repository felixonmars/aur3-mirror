# Maintainer: Vasiliy Lapin <profet@yandex.ru>
pkgname=(
	'php55_9_env'
	'php55_9_env-cgi'
	'php55_9_env-apache'
	'php55_9_env-fpm'
	'php55_9_env-embed'
	'php55_9_env-pear'
	'php55_9_env-enchant'
	'php55_9_env-gd'
	'php55_9_env-intl'
	'php55_9_env-ldap'
	'php55_9_env-mcrypt'
	'php55_9_env-mssql'
	'php55_9_env-odbc'
	'php55_9_env-pgsql'
	'php55_9_env-pspell'
	'php55_9_env-snmp'
	'php55_9_env-sqlite'
	'php55_9_env-tidy'
	'php55_9_env-xsl'
)
pkgver=5.5.9
pkgrel=1
pkgdesc="PHP 5.5.9 built for phpenv"
arch=('i686' 'x86_64')
url='http://www.php.net'
license=('PHP')
makedepends=('apache' 'imap' 'postgresql-libs' 'libldap' 'postfix' 'libvpx'
             'sqlite' 'unixodbc' 'net-snmp' 'libzip' 'enchant' 'file' 'freetds'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'libpng' 'libjpeg' 'icu'
             'curl' 'libxslt' 'openssl' 'bzip2' 'db' 'gmp' 'freetype2' 'systemd')
install='php55_9_env.install'
source=(
	"http://www.php.net/distributions/php-${pkgver}.tar.gz"
	"http://www.php.net/distributions/php-${pkgver}.tar.gz.asc"
	'php.ini.patch'
	'apache.conf'
	'php-fpm.conf.in.patch'
	'php-fpm'
)
md5sums=(
	'c018461604db38af48d1ca304cb592c6'
	'SKIP'
	'4c56e1170a7e818b1c54b4dc36da0149'
	'dec2cbaad64e3abf4f0ec70e1de4e8e9'
	'ed68e6db62c95a447ace56cb0b6a7175'
	'13634a8dbc4b6f01318c80411c3a3cbc'
)
prepare() {
	cd ${srcdir}/php-${pkgver}
	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p0 -i ${srcdir}/php-fpm.conf.in.patch
}
build() {
	local _phpconfig="--srcdir=../php-${pkgver} \
		--config-cache \
		--prefix=/usr/lib/phpenv/versions/php${pkgver} \
		--sbindir=/usr/lib/phpenv/versions/php${pkgver}/usr/bin \
		--sysconfdir=/usr/lib/phpenv/versions/php${pkgver}/etc/php \
		--localstatedir=/usr/lib/phpenv/versions/php${pkgver}/var \
		--with-layout=GNU \
		--with-config-file-path=/usr/lib/phpenv/versions/php${pkgver}/etc/php \
		--with-config-file-scan-dir=/usr/lib/phpenv/versions/php${pkgver}/etc/php/conf.d \
		--disable-rpath \
		--mandir=/usr/lib/phpenv/versions/php${pkgver}/usr/share/man \
		--without-pear \
		"
	local _phpextensions="--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
		--enable-gd-native-ttf \
		--enable-intl=shared \
		--enable-mbstring \
		--enable-opcache \
		--enable-phar=shared \
		--enable-posix=shared \
		--enable-shmop=shared \
		--enable-soap=shared \
		--enable-sockets=shared \
		--enable-sysvmsg=shared \
		--enable-sysvsem=shared \
		--enable-sysvshm=shared \
		--enable-zip=shared \
		--with-bz2=shared \
		--with-curl=shared \
		--with-db4=/usr \
		--with-enchant=shared,/usr \
		--with-fpm-systemd \
		--with-freetype-dir=/usr \
		--with-gd=shared \
		--with-gdbm \
		--with-gettext=shared \
		--with-gmp=shared \
		--with-iconv=shared \
		--with-icu-dir=/usr \
		--with-imap-ssl \
		--with-imap=shared \
		--with-jpeg-dir=/usr \
		--with-vpx-dir=/usr \
		--with-ldap=shared \
		--with-ldap-sasl \
		--with-mcrypt=shared \
		--with-mhash \
		--with-mssql=shared \
		--with-mysql-sock=/run/mysqld/mysqld.sock \
		--with-mysql=shared,mysqlnd \
		--with-mysqli=shared,mysqlnd \
		--with-openssl=shared \
		--with-pcre-regex=/usr \
		--with-pdo-mysql=shared,mysqlnd \
		--with-pdo-odbc=shared,unixODBC,/usr \
		--with-pdo-pgsql=shared \
		--with-pdo-sqlite=shared,/usr \
		--with-pgsql=shared \
		--with-png-dir=/usr \
		--with-pspell=shared \
		--with-snmp=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		"
	EXTENSION_DIR=/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=/usr/lib/phpenv/versions/php${pkgver}/usr/share/pear
	export PEAR_INSTALLDIR
	cd ${srcdir}/php-${pkgver}
	# php
	mkdir ${srcdir}/build-php
	cd ${srcdir}/build-php
	ln -s ../php-${pkgver}/configure
	./configure ${_phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		${_phpextensions}
	make
	# cgi and fcgi
	# reuse the previous run; this will save us a lot of time
	cp -a ${srcdir}/build-php ${srcdir}/build-cgi
	cd ${srcdir}/build-cgi
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-cgi \
		${_phpextensions}
	make
	# apache
	cp -a ${srcdir}/build-php ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	make clean
	./configure ${_phpconfig} \
		--disable-cli \
		--with-apxs2 \
		${_phpextensions}
	make
	# fpm
	cp -a ${srcdir}/build-php ${srcdir}/build-fpm
	cd ${srcdir}/build-fpm
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-fpm \
		--with-fpm-user=http \
		--with-fpm-group=http \
		${_phpextensions}
	make
	# embed
	cp -a ${srcdir}/build-php ${srcdir}/build-embed
	cd ${srcdir}/build-embed
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-embed=shared \
		${_phpextensions}
	make
	# pear
	cp -a ${srcdir}/build-php ${srcdir}/build-pear
	cd ${srcdir}/build-pear
	./configure ${_phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear \
		${_phpextensions}
	make
}
package_php55_9_env() {
	pkgdesc='An HTML-embedded scripting language (phpenv build)'
	depends=('phpenv' 'pcre' 'libxml2' 'bzip2' 'curl')
	backup=('usr/lib/phpenv/versions/php5.5.9/etc/php/php.ini')
	cd ${srcdir}/build-php
	make -j1 INSTALL_ROOT=${pkgdir} install
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/share/pear
	# install php.ini
	install -D -m644 ${srcdir}/php-${pkgver}/php.ini-production ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/php/php.ini
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/php/conf.d/
	# remove static modules
	rm -f ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/{enchant,gd,intl,ldap,mcrypt,mssql,odbc,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rm -rf ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/include/php/include
}
package_php55_9_env-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP (phpenv build)'
	depends=('php55_9_env')
	install -D -m755 ${srcdir}/build-cgi/sapi/cgi/php-cgi ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/bin/php-cgi
}
package_php55_9_env-apache() {
	pkgdesc='Apache SAPI for PHP (phpenv build)'
	depends=('php55_9_env' 'apache')
	backup=('usr/lib/phpenv/versions/php5.5.9/etc/httpd/conf/extra/php5_module.conf')
	install -D -m755 ${srcdir}/build-apache/libs/libphp5.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/httpd/modules/libphp5.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/httpd/conf/extra/php5_module.conf
}
package_php55_9_env-fpm() {
	pkgdesc='FastCGI Process Manager for PHP (phpenv build)'
	depends=('php55_9_env' 'systemd')
	backup=('usr/lib/phpenv/versions/php5.5.9/etc/php/php-fpm.conf')
	install -D -m755 ${srcdir}/php-fpm ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/bin/php-fpm
	install -D -m755 ${srcdir}/build-fpm/sapi/fpm/php-fpm ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/sbin/php-fpm_env
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.8 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/share/man/man8/php-fpm.8
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.conf ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/php/php-fpm.conf
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/php/fpm.d
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/var/log
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/run
}
package_php55_9_env-embed() {
	pkgdesc='Embed SAPI for PHP (phpenv build)'
	depends=('php55_9_env')
	install -D -m755 ${srcdir}/build-embed/libs/libphp5.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/libphp5.so
	install -D -m644 ${srcdir}/php-${pkgver}/sapi/embed/php_embed.h ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/include/php/sapi/embed/php_embed.h
}
package_php55_9_env-pear() {
	pkgdesc='PHP Extension and Application Repository (phpenv build)'
	depends=('php55_9_env')
	backup=('usr/lib/phpenv/versions/php5.5.9/etc/php/pear.conf')
	cd ${srcdir}/build-pear
	make install-pear INSTALL_ROOT=${pkgdir}
	rm -rf ${pkgdir}/.{channels,depdb,depdblock,filemap,lock,registry}
	rm -rf ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/share/pear/.{channels,depdb,depdblock,filemap,lock,registry}
}
package_php55_9_env-enchant() {
	depends=('php55_9_env' 'enchant')
	pkgdesc='enchant module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/enchant.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/enchant.so
}
package_php55_9_env-gd() {
	depends=('php55_9_env' 'libpng' 'libjpeg' 'freetype2' 'libvpx')
	pkgdesc='gd module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/gd.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/gd.so
}
package_php55_9_env-intl() {
	depends=('php55_9_env' 'icu')
	pkgdesc='intl module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/intl.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/intl.so
}
package_php55_9_env-ldap() {
	depends=('php55_9_env' 'libldap')
	pkgdesc='ldap module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/ldap.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/ldap.so
}
package_php55_9_env-mcrypt() {
	depends=('php55_9_env' 'libmcrypt' 'libltdl')
	pkgdesc='mcrypt module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/mcrypt.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/mcrypt.so
}
package_php55_9_env-mssql() {
	depends=('php55_9_env' 'freetds')
	pkgdesc='mssql module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/mssql.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/mssql.so
}
package_php55_9_env-odbc() {
	depends=('php55_9_env' 'unixodbc')
	pkgdesc='ODBC modules for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/odbc.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/odbc.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_odbc.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pdo_odbc.so
}
package_php55_9_env-pgsql() {
	depends=('php55_9_env' 'postgresql-libs')
	pkgdesc='PostgreSQL modules for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/pgsql.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_pgsql.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pdo_pgsql.so
}
package_php55_9_env-pspell() {
	depends=('php55_9_env' 'aspell')
	pkgdesc='pspell module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/pspell.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pspell.so
}
package_php55_9_env-snmp() {
	depends=('php55_9_env' 'net-snmp')
	pkgdesc='snmp module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/snmp.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/snmp.so
}
package_php55_9_env-sqlite() {
	depends=('php55_9_env' 'sqlite')
	pkgdesc='sqlite module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/sqlite3.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_sqlite.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pdo_sqlite.so
}
package_php55_9_env-tidy() {
	depends=('php55_9_env' 'tidyhtml')
	pkgdesc='tidy module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/tidy.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/tidy.so
}
package_php55_9_env-xsl() {
	depends=('php55_9_env' 'libxslt')
	pkgdesc='xsl module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/xsl.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/xsl.so
}