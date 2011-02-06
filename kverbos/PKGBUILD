# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=kverbos
pkgver=2.0
pkgrel=1
pkgdesc="KDE4 application for studing Spanish verb forms"
url="http://www.mzgz.de/kverbos/ekverbos.htm"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdeedu-libkdeedu' 'kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://www.mzgz.de/kverbos/$pkgname-$pkgver.tar.gz)
md5sums=('343d5297b59c855a2ee1fd870f7ecc35')

build() {
	  cd ${srcdir}/$pkgname-$pkgver
	  cmake . -DCMAKE_INSTALL_PREFIX=/usr
	  make || return 1
	  make DESTDIR=${pkgdir} install || return 1
	}
