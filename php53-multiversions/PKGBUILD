# Maintainer: Charly Caulet <contact@charly-caulet.net>

pkgname=php53-multiversions
pkgver=5.3.22
pkgrel=1
pkgdesc='A high-level scripting language. Installs PHP5.3 in an isolated directory so it does not break any other version installed.'
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
backup=()
depends=('glibc' 'readline' 'ncurses' 'libxml2' 'pcre')
makedepends=('postgresql-libs' 'libldap'
             'libpng' 'libjpeg' 'sqlite3' 'unixodbc' 'gmp'
             'aspell' 'libtool' 'freetype2' 'libjpeg'
             'curl' 'libxslt' 'pam' 'openssl' 'bzip2' 'gdbm' 'db')
optdepends=('bzip2: bz2'
            'curl: curl'
            'gdbm: dba'
            'libpng: gd'
            'libjpeg: gd'
            'freetype2: gd'
            'pam: imap'
            'libldap: ldap'
            'libmcrypt: mcrypt'
            'libtool: mcrypt'
            'libmysqlclient: mysql/mysqli/pdo_mysql'
            'unixodbc: odbc/pdo_odbc'
            'openssl: openssl'
            'postgresql-libs: pgsql/pdo_pgsql'
            'aspell: pspell'
            'net-snmp: snmp'
            'sqlite3: pdo_sqlite'
            'libxslt: xsl'
            'mhash: mhash'
            'gmp: gmp'
            )
provides=("php=$pkgver")
conflicts=()
source=("http://www.php.net/distributions/php-${pkgver}.tar.bz2"
        'php.ini')
md5sums=('bf351426fc7f97aa13914062958a6100'
	 'f0d45f5840632735bc49828a55bcc856')
install_dir='/opt/php/php53/'
build() {
	phpconfig="--prefix=${install_dir} \
	--sysconfdir=${install_dir}/etc/php \
	--with-layout=GNU \
	--with-config-file-path=${install_dir}/etc/php \
	--with-config-file-scan-dir=${install_dir}/etc/php/conf.d \
	--enable-inline-optimization \
	--disable-debug \
	--disable-rpath \
	--disable-static \
	--enable-shared \
	"

	phpextensions="--with-openssl=shared \
	--with-zlib=shared \
	--enable-bcmath=shared \
	--with-bz2=shared \
	--enable-calendar=shared \
	--with-curl=shared \
	--enable-dba=shared \
	--without-db2 \
	--without-db3 \
	--with-db4=shared \
	--with-gdbm=shared \
	--enable-dbase=shared \
	--enable-exif=shared \
	--enable-ftp=shared \
	--with-gd=shared \
	--enable-gd-native-ttf \
	--with-jpeg-dir=shared,/usr \
	--with-png-dir=shared,/usr \
	--with-gettext=shared \
	--without-imap \
	--without-imap-ssl \
	--with-ldap=shared \
	--enable-mbstring=shared \
	--without-mcrypt \
	--with-mysql=shared \
	--with-mysql-sock=/tmp/mysql.sock \
	--with-mysql=shared \
	--with-mysqli=shared \
	--with-ncurses=shared \
	--with-unixODBC=shared,/usr \
	--enable-pdo=shared \
	--with-pdo-mysql=shared \
	--with-pdo-sqlite=shared,/usr \
	--with-pdo-odbc=shared,unixODBC,/usr \
	--with-pdo-pgsql=shared \
	--with-sqlite=shared \
	--enable-sqlite-utf8 \
	--with-pgsql=shared \
	--enable-shmop=shared \
	--without-snmp \
	--enable-soap=shared \
	--enable-sysvmsg=shared \
	--enable-sysvsem=shared \
	--enable-sysvshm=shared \
	--with-xsl=shared \
	--enable-zip=shared \
	--enable-posix=shared \
	--enable-sockets=shared \
	--enable-xml \
	--with-ttf=shared \
	--enable-session=shared \
	--with-regex=php \
	--with-pcre-regex=/usr \
	--enable-mbstring=all \
	--enable-mbregex \
	--enable-json=shared \
	--with-iconv=shared \
	--with-xmlrpc=shared \
	--with-pspell=shared \
	--with-freetype-dir=shared,/usr \
	--with-mime-magic=shared \
	--with-gmp=shared \
	--without-mhash \
	"

	export PEAR_INSTALLDIR=${install_dir}/share/pear

	cd ${srcdir}/php-${pkgver}

	# cli
	./configure ${phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear=${PEAR_INSTALLDIR} \
		${phpextensions}
	make
	# make test
	make INSTALL_ROOT=${pkgdir} install

	# cleanup
	rm -f ${pkgdir}`${pkgdir}/usr/bin/php-config --extension-dir`/*.a
	# install php.ini
	install -D -m644 ${srcdir}/php.ini ${pkgdir}${install-dir}/etc/php/php.ini
	install -d -m755 ${pkgdir}${install_dir}/etc/php/conf.d/

	# cgi and fcgi
	./configure ${phpconfig} \
		--enable-fastcgi \
		--enable-cgi \
		--enable-discard-path \
		--enable-force-cgi-redirect \
		--disable-cli \
		${phpextensions}
	make
	install -m755 sapi/cgi/php-cgi ${pkgdir}${install_dir}/bin/php-cgi

#	# mod_php
#	./configure ${phpconfig} \
#		--with-apxs2 \
#		--disable-cli \
#		${phpextensions}
#	make
#	install -D -m644 libs/libphp5.so ${pkgdir}/usr/lib/httpd/modules/libphp5.so
#	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php5_module.conf
}
