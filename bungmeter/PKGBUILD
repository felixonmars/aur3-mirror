# Contributor: Sven Schulz <omee@archlinux.de>
# ------------------------------------------------------
# Sun, 28 Dec 2008 13:57:14 +0000
# moved to unsupported from extra repo
# ------------------------------------------------------
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: roberto <roberto@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=bungmeter
pkgver=2.0.1
pkgrel=2
pkgdesc="A fork of fnetload - a graphical network monitor designed to be small and lightweight."
url="http://freshmeat.net/projects/bungmeter/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
source=(http://grecni.com/bungmeter/$pkgname-$pkgver.tar.bz2)
md5sums=('318b8538e0c3556443b49ded420a8c06')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	    ./configure --prefix=/usr
	  make || return 1
	  make prefix=$startdir/pkg/usr install
	}
