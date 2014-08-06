# Maintainer: David Roheim <david.roheim@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=phpng-git
pkgname=('phpng'
         'phpng-cgi'
         'phpng-apache'
         'phpng-fpm'
         'phpng-embed'
         'phpng-pear'
         'phpng-enchant'
         'phpng-gd'
         'phpng-intl'
         'phpng-ldap'
         'phpng-mcrypt'
         'phpng-pgsql'
         'phpng-pspell'
         'phpng-snmp'
         'phpng-sqlite'
         'phpng-tidy'
         'phpng-xsl')
pkgver=5.7.82520.e677e8c
pkgrel=1
arch=('i686' 'x86_64')
license=('PHP')
conflicts=('php')
provides=('php')
url='http://www.php.net'
makedepends=('apache' 'imap' 'postgresql-libs' 'libldap' 'postfix' 'systemd'
             'sqlite' 'net-snmp' 'libzip' 'enchant' 'file' 'git' 'libvpx'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'libpng' 'libjpeg' 'icu'
             'curl' 'libxslt' 'openssl' 'bzip2' 'db' 'gmp' 'freetype2')
source=("phpng-git::git://github.com/php/php-src.git#branch=phpng"
        'php.ini.patch'
        'apache.conf'
        'php-fpm.conf.in.patch'
        'logrotate.d.php-fpm'
        'php-fpm.service'
        'php-fpm.tmpfiles')
sha256sums=('SKIP'
            'd2ebb7bb4490c626aded51beb9a141e01933a67c9e9dc40d0d39ba5c31acc2fa'
            '8b5b15f1c348d8897d837ea9894157d9630dc542bbb0dbc7ad93c5dc0235d1d5'
            '780f3d1fb11028aab48ce0e7e8de37d7506ab04363404312cb1dffba7ac04e80'
            'a6d482acc0a6c7badc1945fd82ab7dfdb99edd2f603a5f25d06062a96ddfebce'
            'b4e91a2712ee16175f924e1b1906c062065d287918c13b45fc3e3fddb014621e'
            '640dba0d960bfeaae9ad38d2826d3f6b5d6c175a4d3e16664eefff29141faad5')
_gitbranch=phpng

pkgver() {
	cd "${SRCDEST}/phpng"
	echo 5.7.$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})
}


prepare() {
	cd ${srcdir}/${pkgbase}
	./buildconf
	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p0 -i ${srcdir}/php-fpm.conf.in.patch
	# Just because our Apache 2.4 is configured with a threaded MPM by default does not mean we want to build a ZTS PHP.
	# Let's supress this behaviour and build a SAPI that works fine with the prefork MPM.
	sed '/APACHE_THREADED_MPM=/d' -i sapi/apache2handler/config.m4 -i configure
}

build() {
	local _phpconfig="--srcdir=../${pkgbase} \
		--config-cache \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/php \
		--localstatedir=/var \
		--with-layout=GNU \
		--with-config-file-path=/etc/php \
		--with-config-file-scan-dir=/etc/php/conf.d \
		--disable-rpath \
		--mandir=/usr/share/man \
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
		--with-mysql-sock=/run/mysqld/mysqld.sock \
		--with-mysql=shared,mysqlnd \
		--with-mysqli=shared,mysqlnd \
		--with-openssl=shared \
		--with-pcre-regex=/usr \
		--with-pdo-mysql=shared,mysqlnd \
		--with-pdo-pgsql=shared \
		--with-pdo-sqlite=shared,/usr \
		--with-pgsql=shared \
		--with-png-dir=/usr \
		--with-pspell=shared \
		--with-snmp=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		"

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=/usr/share/pear
	export PEAR_INSTALLDIR

	cd ${srcdir}/${pkgbase}

	# php
	mkdir ${srcdir}/build-php
	cd ${srcdir}/build-php
	ln -s ../${pkgbase}/configure
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

# check() {
# 	cd ${srcdir}/build-php
# 	export SNMP_TIMEOUT=1
# 	export SNMP_RETRIES=0
# 	export NO_INTERACTION=1
# 	make test
# 	echo
# }

package_phpng() {
	pkgdesc='An HTML-embedded scripting language'
	depends=('pcre' 'libxml2' 'bzip2' 'curl')
	backup=('etc/php/php.ini')

	cd ${srcdir}/build-php
	make -j1 INSTALL_ROOT=${pkgdir} install
	install -d -m755 ${pkgdir}/usr/share/pear
	# install php.ini
	install -D -m644 ${srcdir}/${pkgbase}/php.ini-production ${pkgdir}/etc/php/php.ini
	install -d -m755 ${pkgdir}/etc/php/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/php/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/php/modules/{enchant,gd,intl,ldap,mcrypt,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include
}

package_phpng-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=('phpng')

	install -D -m755 ${srcdir}/build-cgi/sapi/cgi/php-cgi ${pkgdir}/usr/bin/php-cgi
}

package_phpng-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=('phpng' 'apache')
	backup=('etc/httpd/conf/extra/php5_module.conf')

	install -D -m755 ${srcdir}/build-apache/libs/libphp5.so ${pkgdir}/usr/lib/httpd/modules/libphp5.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php5_module.conf
}

package_phpng-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=('phpng' 'systemd')
	backup=('etc/php/php-fpm.conf')
	install='php-fpm.install'

	install -D -m755 ${srcdir}/build-fpm/sapi/fpm/php-fpm ${pkgdir}/usr/bin/php-fpm
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.8 ${pkgdir}/usr/share/man/man8/php-fpm.8
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.conf ${pkgdir}/etc/php/php-fpm.conf
	install -D -m644 ${srcdir}/logrotate.d.php-fpm ${pkgdir}/etc/logrotate.d/php-fpm
	install -d -m755 ${pkgdir}/etc/php/fpm.d
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/php-fpm.conf
	install -D -m644 ${srcdir}/php-fpm.service ${pkgdir}/usr/lib/systemd/system/php-fpm.service
}

package_phpng-embed() {
	pkgdesc='Embed SAPI for PHP'
	depends=('phpng')

	install -D -m755 ${srcdir}/build-embed/libs/libphp5.so ${pkgdir}/usr/lib/libphp5.so
	install -D -m644 ${srcdir}/${pkgbase}/sapi/embed/php_embed.h ${pkgdir}/usr/include/php/sapi/embed/php_embed.h
}

package_phpng-pear() {
	pkgdesc='PHP Extension and Application Repository'
	depends=('phpng')
	backup=('etc/php/pear.conf')

	cd ${srcdir}/build-pear
	make install-pear INSTALL_ROOT=${pkgdir}
	rm -rf ${pkgdir}/usr/share/pear/.{channels,depdb,depdblock,filemap,lock,registry}
}

package_phpng-enchant() {
	depends=('phpng' 'enchant')
	pkgdesc='enchant module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/enchant.so ${pkgdir}/usr/lib/php/modules/enchant.so
}

package_phpng-gd() {
	depends=('phpng' 'libpng' 'libjpeg' 'freetype2' 'libvpx')
	pkgdesc='gd module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/gd.so ${pkgdir}/usr/lib/php/modules/gd.so
}

package_phpng-intl() {
	depends=('phpng' 'icu')
	pkgdesc='intl module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/intl.so ${pkgdir}/usr/lib/php/modules/intl.so
}

package_phpng-ldap() {
	depends=('phpng' 'libldap')
	pkgdesc='ldap module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/ldap.so ${pkgdir}/usr/lib/php/modules/ldap.so
}

package_phpng-mcrypt() {
	depends=('phpng' 'libmcrypt' 'libltdl')
	pkgdesc='mcrypt module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/mcrypt.so ${pkgdir}/usr/lib/php/modules/mcrypt.so
}

package_phpng-pgsql() {
	depends=('phpng' 'postgresql-libs')
	pkgdesc='PostgreSQL modules for PHP'
	install -D -m755 ${srcdir}/build-php/modules/pgsql.so ${pkgdir}/usr/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_pgsql.so ${pkgdir}/usr/lib/php/modules/pdo_pgsql.so
}

package_phpng-pspell() {
	depends=('phpng' 'aspell')
	pkgdesc='pspell module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/pspell.so ${pkgdir}/usr/lib/php/modules/pspell.so
}

package_phpng-snmp() {
	depends=('phpng' 'net-snmp')
	pkgdesc='snmp module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/snmp.so ${pkgdir}/usr/lib/php/modules/snmp.so
}

package_phpng-sqlite() {
	depends=('phpng' 'sqlite')
	pkgdesc='sqlite module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/sqlite3.so ${pkgdir}/usr/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_sqlite.so ${pkgdir}/usr/lib/php/modules/pdo_sqlite.so
}

package_phpng-tidy() {
	depends=('phpng' 'tidyhtml')
	pkgdesc='tidy module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/tidy.so ${pkgdir}/usr/lib/php/modules/tidy.so
}

package_phpng-xsl() {
	depends=('phpng' 'libxslt')
	pkgdesc='xsl module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/xsl.so ${pkgdir}/usr/lib/php/modules/xsl.so
}
