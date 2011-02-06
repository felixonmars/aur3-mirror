# Maintainer: Ben Allen <ben@sysadminschronicles.com>
pkgname="php-lsapi"
pkgver=5.2.5
pkgrel=1
_lsapiver=4.5
_litespeed_dir="opt/lsws"
provides=('php-lsapi')
pkgdesc='Litespeed PHP LSAPI'
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.litespeedtech.com'
backup=('opt/lsws/php/php.ini')
depends=('glibc' 'libxml2')
makedepends=('postgresql-libs'  \
             'libpng' 'libjpeg' 'libtool'  \
             'openssl' 'bzip2' 'gdbm')
options=('emptydirs')
noextract=("php-litespeed-${_lsapiver}.tgz")
source=("http://www.php.net/distributions/php-${pkgver}.tar.bz2" \
        'php.ini' "http://www.litespeedtech.com/packages/lsapi/php-litespeed-${_lsapiver}.tgz")
md5sums=('1fe14ca892460b09f06729941a1bb605' \
         'bc4d8b057354259588ed249839f1d20a' \
	 'd8b74f58d83b228ddeaf5378fc023824' )
build() {

	phpconfig="--with-config-file-path=../php \
	--with-litespeed --with-pgsql --with-exif --enable-bcmath \
	--enable-inline-optimization \
	--with-gd --with-jpeg-dir=/usr/lib \
	--with-png-dir=/usr/lib --with-gettext \
	--disable-debug \
	--disable-rpath \
	--disable-static \
	--enable-shared \
	--disable-cli"

	cd ${startdir}/src/php-${pkgver}
	
	tar -C ${startdir}/src/php-${pkgver}/sapi -xzf ${startdir}/php-litespeed-${_lsapiver}.tgz

	touch ac*
	./buildconf --force

	./configure ${phpconfig} || return 1
	make || return 1
	
	install -D -m755 ${startdir}/src/php-${pkgver}/sapi/litespeed/php ${startdir}/pkg/${_litespeed_dir}/fcgi-bin/lsphp
	install -D -m644 ${startdir}/src/php.ini ${startdir}/pkg/${_litespeed_dir}/php/php.ini
}
