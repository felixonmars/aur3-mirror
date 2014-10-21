# Maintainer: Vasiliy Lapin <profet@yandex.ru>
pkgver=5.3.29
pkgname=(
	'php53_29_env'
	'php53_29_env-cgi'
	'php53_29_env-apache'
	'php53_29_env-fpm'
	'php53_29_env-embed'
	'php53_29_env-pear'
	'php53_29_env-enchant'
	'php53_29_env-gd'
	'php53_29_env-intl'
	'php53_29_env-ldap'
	'php53_29_env-mcrypt'
	'php53_29_env-mssql'
	'php53_29_env-odbc'
	'php53_29_env-pgsql'
	'php53_29_env-pspell'
	'php53_29_env-snmp'
	'php53_29_env-sqlite'
	'php53_29_env-tidy'
	'php53_29_env-xsl'
)
pkgrel=1
pkgdesc="PHP 5.3.29 built for phpenv"
arch=('i686' 'x86_64')
url='http://www.php.net'
license=('PHP')
makedepends=('apache' 'imap' 'postgresql-libs' 'libldap' 'postfix'
             'sqlite' 'unixodbc' 'net-snmp' 'libzip' 'enchant' 'file' 'freetds'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'libpng' 'libjpeg' 'icu'
             'curl' 'libxslt' 'openssl' 'bzip2' 'db' 'gmp' 'freetype2')
install='php53_29_env.install'
source=(
	"php-${pkgver}.tar.gz::http://ru2.php.net/get/php-${pkgver}.tar.gz/from/this/mirror"
    'php.ini.patch' 
	'apache.conf' 
	'freetype.patch'
	'php-fpm'
	'php-fpm.conf.in.patch'
)
md5sums=(
	'ebfa96ea636b2a7ece71e78ad116a338'
	'8f2a819fd2ac64c44ee89dced76a9fb1'
    'dec2cbaad64e3abf4f0ec70e1de4e8e9'
	'bd375f73f6f89dcd53b8cce8015d13b3'
	'13634a8dbc4b6f01318c80411c3a3cbc'
	'e5e39e94799bc5bc8af6024c5be4054a'
)
prepare() {
	cd ${srcdir}/php-${pkgver}
	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p0 -i ${srcdir}/php-fpm.conf.in.patch
	# freetype.h path fix
    patch -p0 -i ${srcdir}/freetype.patch
}
build() {
	phpconfig="--srcdir=../php-${pkgver} \
		--prefix=/usr/lib/phpenv/versions/php${pkgver} \
		--sysconfdir=/usr/lib/phpenv/versions/php${pkgver}/etc/php \
		--localstatedir=/usr/lib/phpenv/versions/php${pkgver}/var \
		--with-layout=GNU \
		--with-config-file-path=/usr/lib/phpenv/versions/php${pkgver}/etc/php \
		--with-config-file-scan-dir=/usr/lib/phpenv/versions/php${pkgver}/etc/php/conf.d \
		--enable-inline-optimization \
		--disable-debug \
		--disable-rpath \
		--disable-static \
		--enable-shared \
		--mandir=/usr/lib/phpenv/versions/php${pkgver}/usr/share/man \
		--without-pear \
		"
	phpextensions="--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
		--enable-gd-native-ttf \
		--enable-intl=shared \
		--enable-json=shared \
		--enable-mbregex \
		--enable-mbstring \
		--enable-pdo \
		--enable-phar=shared \
		--enable-posix=shared \
		--enable-session \
		--enable-shmop=shared \
		--enable-soap=shared \
		--enable-sockets=shared \
		--enable-sqlite-utf8 \
		--enable-sysvmsg=shared \
		--enable-sysvsem=shared \
		--enable-sysvshm=shared \
		--enable-xml \
		--enable-zip=shared \
		--with-bz2=shared \
		--with-curl=shared \
		--with-db4=/usr \
		--with-enchant=shared,/usr \
		--with-freetype-dir=share,/usr \
		--with-gd=shared \
		--with-gdbm=shared \
		--with-gettext=shared \
		--with-gmp=shared \
		--with-iconv=shared \
		--with-icu-dir=/usr \
		--with-jpeg-dir=shared,/usr \
		--with-ldap=shared \
		--with-ldap-sasl \
		--with-mcrypt=shared \
		--with-mhash \
		--with-mssql=shared \
		--with-mysql-sock=/var/run/mysqld/mysqld.sock \
		--with-mysql=shared,mysqlnd \
		--with-mysqli=shared,mysqlnd \
		--with-openssl=shared \
		--with-pcre-regex=/usr \
		--with-pdo-mysql=shared,mysqlnd \
		--with-pdo-odbc=shared,unixODBC,/usr \
		--with-pdo-pgsql=shared \
		--with-pdo-sqlite=shared,/usr \
		--with-pgsql=shared \
		--with-png-dir=shared,/usr \
		--with-pspell=shared \
		--with-regex=php \
		--with-snmp=shared \
		--with-sqlite3=shared,/usr \
		--with-sqlite=shared \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		--without-db2 \
		--without-db3 \
		"
	EXTENSION_DIR=/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=/usr/lib/phpenv/versions/php${pkgver}/usr/share/pear
	export PEAR_INSTALLDIR
	export CPPFLAGS="${CPPFLAGS} -O2"
	cd ${srcdir}/php-${pkgver}
	# php
	mkdir ${srcdir}/build-php
	cd ${srcdir}/build-php
	ln -s ../php-${pkgver}/configure
	./configure ${phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		${phpextensions}
	make
	# cgi and fcgi
	# reuse the previous run; this will save us a lot of time
	cp -a ${srcdir}/build-php ${srcdir}/build-cgi
	cd ${srcdir}/build-cgi
	./configure ${phpconfig} \
		--disable-cli \
		--enable-cgi \
		${phpextensions}
	make
	# apache
	cp -a ${srcdir}/build-php ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	# not on my watch
	make clean
	./configure ${phpconfig} \
		--disable-cli \
		--with-apxs2 \
		${phpextensions}
	make
	# fpm
	cp -a ${srcdir}/build-php ${srcdir}/build-fpm
	cd ${srcdir}/build-fpm
	./configure ${phpconfig} \
		--disable-cli \
		--enable-fpm \
		--with-fpm-user=http \
		--with-fpm-group=http \
		${phpextensions}
	make
	# embed
	cp -a ${srcdir}/build-php ${srcdir}/build-embed
	cd ${srcdir}/build-embed
	./configure ${phpconfig} \
		--disable-cli \
		--enable-embed=shared \
		${phpextensions}
	make
	# pear
	cp -a ${srcdir}/build-php ${srcdir}/build-pear
	cd ${srcdir}/build-pear
	./configure ${phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear \
		${phpextensions}
	make
}
package_php53_29_env() {
	pkgdesc='An HTML-embedded scripting language (phpenv build)'
	depends=('phpenv' 'pcre' 'libxml2' 'bzip2' 'curl')
	backup=('usr/lib/phpenv/versions/php5.3.29/etc/php/php.ini')
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

package_php53_29_env-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP (phpenv build)'
	depends=('php53_29_env')
	install -D -m755 ${srcdir}/build-cgi/sapi/cgi/php-cgi ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/bin/php-cgi
}
package_php53_29_env-apache() {
	pkgdesc='Apache SAPI for PHP (phpenv build)'
	depends=('php53_29_env' 'apache')
	backup=('usr/lib/phpenv/versions/php5.3.29/etc/httpd/conf/extra/php5_module.conf')
	install -D -m755 ${srcdir}/build-apache/libs/libphp5.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/httpd/modules/libphp5.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/httpd/conf/extra/php5_module.conf
}
package_php53_29_env-fpm() {
	pkgdesc='FastCGI Process Manager for PHP (phpenv build)'
	depends=('php53_29_env')
	backup=('usr/lib/phpenv/versions/php5.3.29/etc/php/php-fpm.conf')
	install -D -m755 ${srcdir}/php-fpm ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/bin/php-fpm
	install -D -m755 ${srcdir}/build-fpm/sapi/fpm/php-fpm ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/sbin/php-fpm_env
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.8 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/share/man/man8/php-fpm.8
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.conf ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/php/php-fpm.conf
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/etc/php/fpm.d
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/var/log
	install -d -m755 ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/run
}
package_php53_29_env-embed() {
	pkgdesc='Embed SAPI for PHP (phpenv build)'
	depends=('php53_29_env')
	install -D -m755 ${srcdir}/build-embed/libs/libphp5.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/libphp5.so
	install -D -m644 ${srcdir}/php-${pkgver}/sapi/embed/php_embed.h ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/include/php/sapi/embed/php_embed.h
}
package_php53_29_env-pear() {
	pkgdesc='PHP Extension and Application Repository (phpenv build)'
	depends=('php53_29_env')
	backup=('usr/lib/phpenv/versions/php5.3.29/etc/php/pear.conf')
	cd ${srcdir}/build-pear
	make -j1 install-pear INSTALL_ROOT=${pkgdir}
	local i
	while read i; do
		[ ! -e "$i" ] || rm -rf "$i"
	done < <(find ${pkgdir} -name '.*')
}
package_php53_29_env-enchant() {
	depends=('php53_29_env' 'enchant')
	pkgdesc='enchant module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/enchant.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/enchant.so
}
package_php53_29_env-gd() {
	depends=('php53_29_env' 'libpng' 'libjpeg' 'freetype2')
	pkgdesc='gd module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/gd.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/gd.so
}
package_php53_29_env-intl() {
	depends=('php53_29_env' 'icu')
	pkgdesc='intl module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/intl.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/intl.so
}
package_php53_29_env-ldap() {
	depends=('php53_29_env' 'libldap')
	pkgdesc='ldap module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/ldap.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/ldap.so
}
package_php53_29_env-mcrypt() {
	depends=('php53_29_env' 'libmcrypt' 'libltdl')
	pkgdesc='mcrypt module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/mcrypt.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/mcrypt.so
}
package_php53_29_env-mssql() {
	depends=('php53_29_env' 'freetds')
	pkgdesc='mssql module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/mssql.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/mssql.so
}
package_php53_29_env-odbc() {
	depends=('php53_29_env' 'unixodbc')
	pkgdesc='ODBC modules for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/odbc.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/odbc.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_odbc.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pdo_odbc.so
}
package_php53_29_env-pgsql() {
	depends=('php53_29_env' 'postgresql-libs')
	pkgdesc='PostgreSQL modules for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/pgsql.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_pgsql.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pdo_pgsql.so
}
package_php53_29_env-pspell() {
	depends=('php53_29_env' 'aspell')
	pkgdesc='pspell module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/pspell.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pspell.so
}
package_php53_29_env-snmp() {
	depends=('php53_29_env' 'net-snmp')
	pkgdesc='snmp module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/snmp.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/snmp.so
}
package_php53_29_env-sqlite() {
	depends=('php53_29_env' 'sqlite')
	pkgdesc='sqlite module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/sqlite3.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_sqlite.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/pdo_sqlite.so
}
package_php53_29_env-tidy() {
	depends=('php53_29_env' 'tidyhtml')
	pkgdesc='tidy module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/tidy.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/tidy.so
}
package_php53_29_env-xsl() {
	depends=('php53_29_env' 'libxslt')
	pkgdesc='xsl module for PHP (phpenv build)'
	install -D -m755 ${srcdir}/build-php/modules/xsl.so ${pkgdir}/usr/lib/phpenv/versions/php${pkgver}/usr/lib/php/modules/xsl.so
}