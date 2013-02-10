# Maintainer: Aaron Abbott <aaron.abbott1@gmail.com>
pkgname=indicator-virtualbox
pkgver=1.1.1
_pkgver_major=1.1
pkgrel=1
pkgdesc="An indicator that displays and start all virtualbox machines"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-stickynotes"
license=('GPL3')
depends=('autoconf' 'make' 'intltool' 'libappindicator' 'gdk-pixbuf2' 'libxml2')
source=("https://launchpad.net/${pkgname}/${_pkgver_major}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
	'autogen.ac.patch')
md5sums=('5e3330d4f036f9beed63cd33436ae3d0'
         '853158c6fb4f519ca0a9d053178852ca')

build() {
	cd ${srcdir}
	
	## This patch fixes the error about obsolete 'AM_CONFIG_HEADER' macro
	patch -p1 < autogen.ac.patch
	
	cd  ${pkgname}-${pkgver}
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd  ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
