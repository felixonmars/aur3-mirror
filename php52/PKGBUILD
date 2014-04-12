# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=php52
_pkgname=php
pkgver=5.2.17
pkgrel=2
pkgdesc='A high-level scripting language'
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
backup=('etc/php/php.ini')
depends=('glibc' 'readline' 'ncurses' 'libxml2' 'pcre')
makedepends=('apache' 'postgresql-libs' 'mariadb' 'libldap' 'smtp-server' 
             'libpng' 'libjpeg' 'sqlite3' 'unixodbc' 'net-snmp' 'mhash' 'gmp'
             'libmcrypt' 'tidyhtml' 'aspell' 'libtool' 'freetype2' 'libjpeg' 
             'curl' 'libxslt' 'pam' 'openssl' 'bzip2' 'gdbm' 'db4.8')
optdepends=('bzip2: bz2'
            'curl: curl'
            'gdbm: dba'
            'libpng: gd'
            'libjpeg: gd'
            'freetype2: gd'
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
            'tidyhtml: tidy'
            'libxslt: xsl'
            'mhash: mhash'
            'gmp: gmp'
            )
source=(https://www.pccc.com/downloads/apache/current/${_pkgname}-${pkgver}.tar.bz2
        'php.ini' 'apache.conf' 'php-5.4.5-libxm2-2.9.0.patch' 'pcre_info.patch')
md5sums=('b27947f3045220faf16e4d9158cbfe13'
         '50b6a4ce330b016e19cb922d202ab170'
         '96ca078be6729b665be8a865535a97bf'
         'd6f4184780b161181cac0e37ddc69141'
         '7ccc77d2446ae660dabefceae1fc4940')

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	sed -i 's/freetype2\/freetype/freetype2/' configure
	patch -p0 < ../php-5.4.5-libxm2-2.9.0.patch
	patch -p1 < ../pcre_info.patch
}

build() {
	phpconfig="--prefix=/usr \
	--sysconfdir=/etc/php \
	--with-layout=GNU \
	--with-config-file-path=/etc/php \
	--with-config-file-scan-dir=/etc/php/conf.d \
	--enable-inline-optimization \
	--disable-debug \
	--disable-rpath \
	--disable-static \
	--enable-shared \
	--mandir=/usr/share/man \
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
	--without-db4 \
	--with-gdbm=shared \
	--enable-dbase=shared \
	--enable-exif=shared \
	--enable-ftp=shared \
	--with-gd=shared \
	--enable-gd-native-ttf \
	--with-jpeg-dir=shared,/usr \
	--with-png-dir=shared,/usr \
	--with-gettext=shared \
	--with-ldap=shared \
	--enable-mbstring=shared \
	--with-mcrypt=shared \
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
	--with-snmp=shared \
	--enable-soap=shared \
	--with-tidy=shared \
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
	--with-mhash=shared \
	"

	PEAR_INSTALLDIR=/usr/share/pear
	export PEAR_INSTALLDIR

	cd ${srcdir}/${_pkgname}-${pkgver}

	# cli
	./configure ${phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear=/usr/share/pear \
		${phpextensions}
	make
	# make test
	make INSTALL_ROOT=${pkgdir} install

	# cleanup
	rm -f ${pkgdir}`${pkgdir}/usr/bin/php-config --extension-dir`/*.a
	# install php.ini
	install -D -m644 ${srcdir}/php.ini ${pkgdir}/etc/php/php.ini
	install -d -m755 ${pkgdir}/etc/php/conf.d/

	# cgi and fcgi
	./configure ${phpconfig} \
		--enable-fastcgi \
		--enable-cgi \
		--enable-discard-path \
		--enable-force-cgi-redirect \
		--disable-cli \
		${phpextensions}
	make
	install -D -m755 sapi/cgi/php-cgi ${pkgdir}/usr/bin/php-cgi

	# mod_php
	./configure ${phpconfig} \
		--with-apxs2 \
		--disable-cli \
		${phpextensions}
	make
	install -D -m644 libs/libphp5.so ${pkgdir}/usr/lib/httpd/modules/libphp5.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php5_module.conf
}
