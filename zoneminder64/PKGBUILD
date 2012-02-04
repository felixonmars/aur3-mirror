# This is a ZoneMinder PKGBUILD file for x86_64!
# Contributor: Vladimir Ermakov <vooon341@gmail.com>
# Contributor: Ross melin <rdmelin@gmail.com>
# Contributor: Francesco Di Battista <teme.84@gmail.com>

pkgname=zoneminder64
pkgver=1.24.4
pkgrel=5
pkgdesc="Capture, analyse, record and monitor video security cameras."
arch=('i686' 'x86_64')
url="http://www.zoneminder.com"
license=('GPL')
groups=()
depends=('apache' 'php' 'mysql' 'pcre' 'openssl' 'ffmpeg' 'perl-php-serialization' 'perl-libwww' 'perl-date-manip' 'perl-unicode-map' 'perl-dbi' 'perl-dbd-mysql' 'perl-io-stringy' 'perl-mime-lite' 'perl-timedate' 'perl-x10' 'perl-time-modules' 'perl-net-smtp-ssl' 'perl-sys-mmap' 'sudo' 'libv4l' 'libjpeg' 'gnutls' 'php-apache')
makedepends=()
provides=(zoneminder)
conflicts=(zoneminder)
replaces=()
backup=(etc/zm.conf)
options=()
install=zoneminder.install
source=(http://www2.zoneminder.com/downloads/ZoneMinder-1.24.4.tar.gz \
	http://downloads.sourceforge.net/sourceforge/jscalendar/jscalendar-1.0.zip \
	http://www.charliemouse.com:8080/code/cambozola/cambozola-latest.tar.gz \
	zm.rc.d \
	Controls_Orbit.sql \
	zminit.arch \
	customdb \
	httpd-zm.conf \
	zmfilter.pl \
	zmeventbackup)

build() {
	cd "$srcdir/ZoneMinder-$pkgver"

	cat ../Controls_Orbit.sql >> db/zm_create.sql.in
	sed -i '22s/^$/#include <cstdio>/' src/zm_utils.cpp
	sed -i 's/$max_socket_tries = 3;/$max_socket_tries = 15;/' web/ajax/stream.php || return 1

	aclocal
	autoconf
	automake

	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--with-libarch=lib \
		--with-webuser=http \
		--with-webgroup=http \
		--with-mysql=/usr \
		--with-ffmpeg=/usr \
		--with-webdir=/var/lib/zm/www  \
		--with-cgidir=/var/lib/zm/cgi-bin \
		--enable-mmap=no \
		--enable-debug=no \
		ZM_SSL_LIB=openssl \
		CPPFLAGS="-D__STDC_CONSTANT_MACROS"

	make || return 1
	make DESTDIR="$pkgdir" install || return 1

	install -D -m 700 $srcdir/zminit.arch  $pkgdir/usr/bin/zminit
	install -D -m 700 $srcdir/zm.rc.d  $pkgdir/etc/rc.d/zm
	for f in zmdbbackup zmdbrestore zmeventdump; do
		install -D -m 700 scripts/$f  $pkgdir/usr/bin/$f
	done
	install -D -m 700 scripts/zmlogrotate.conf  $pkgdir/etc/logrotate.d/zm
	install -D -m 700 $srcdir/zmeventbackup  $pkgdir/etc/cron.hourly/zmeventbackup
	install -D -m 755 $srcdir/zmfilter.pl $pkgdir/usr/bin/zmfilter.pl

	install -m 644  $srcdir/cambozola-0.92/dist/cambozola.jar $pkgdir/var/lib/zm/www/cambozola.jar

	mkdir -p  $pkgdir/etc/httpd/conf/extra/
	install -m 644 $srcdir/httpd-zm.conf $pkgdir/etc/httpd/conf/extra/httpd-zm.conf

	mv $srcdir/jscalendar-1.0 $pkgdir/var/lib/zm/www/tools/jscalendar

	install -D -m 700 $srcdir/customdb $pkgdir/usr/lib/zm/upgrade/customdb
	install -D  db/zm*.sql $pkgdir/usr/lib/zm/upgrade/

	mkdir -p $pkgdir/var/run/zm

	# remove special files
	find $pkgdir -name "perllocal.pod" \
		-o -name ".packlist" \
		-o -name "*.bs" \
		-delete

	# hack. makefile's hack give error
	chown http:http $pkgdir/etc/zm.conf
	chmod 600 $pkgdir/etc/zm.conf
}

md5sums=('910adc20e5b2dd9fac3c8e7456e67ffc'
         '10f2160fe68294013efcd1473cd36f72'
         '602daba851e726e2399445fda3ca718f'
	 '7c63a72fb93eaeb5a4f4dc056b72fa10'
	 '5033bc098bf497c8aed1fc1b3c9c5f9c'
	 'f9720872736f26d17bc49d8725b75ae4'
	 '4ace13d1e20934abe192ef7372c75988'
	 '00201eba9c0a5d1ed14b10cc55410698'
	 '80c52cc3575073a7462ff6a54886a345'
	 '8b40137b6ff54f2fb26104b70edd22e9')
