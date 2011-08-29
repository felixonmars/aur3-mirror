# $Id: PKGBUILD 136162 2011-08-23 15:55:48Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

base="php"
pkgname=php-pear
pkgver=5.3.8
pkgrel=2
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
depends=('php' 'libxml2')
source=("http://www.php.net/distributions/${base}-${pkgver}.tar.bz2")
pkgdesc='An HTML-embedded scripting language'
md5sums=('704cd414a0565d905e1074ffdc1fadfb')

build() {
	phpconfig="--srcdir=../${base}-${pkgver} \
		--prefix=/usr \
		--sysconfdir=/etc/php \
		--localstatedir=/var \
		--with-layout=GNU \
		--with-config-file-path=/etc/php \
		--with-config-file-scan-dir=/etc/php/conf.d \
		--enable-inline-optimization \
		--disable-debug \
		--disable-rpath \
		--disable-static \
		--enable-shared \
		--mandir=/usr/share/man \
		--with-pear \
		--disable-all \
		--enable-xml \
		--enable-libxml
		"

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=/usr/share/pear
	export PEAR_INSTALLDIR

	cd ${srcdir}/${base}-${pkgver}

	# php
	mkdir ${srcdir}/build-php
	cd ${srcdir}/build-php
	ln -s ../${base}-${pkgver}/configure
	./configure ${phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl
	make
}

package() {
	cd ${srcdir}/build-php
	make -j1 INSTALL_ROOT=${pkgdir} install-pear
}
