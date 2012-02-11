# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=nepomuktvnamer
pkgver=0.2.0
pkgrel=2
pkgdesc="Nepomuk TV Show manager."
arch=('any')
url="http://trueg.wordpress.com/2012/02/11/a-fun-release-nepomuk-tv-namer-0-2/"
license=('GPLv2')
depends=('kdebase-runtime>=4.5.80' 'shared-desktop-ontologies-git' 'soprano' 'libtvdb')
makedepends=('cmake')
source=(ftp://ftp.kde.org/pub/kde/unstable/nepomuk/$pkgname-$pkgver.tar.bz2)
conflicts=('nepomuktvnamer-git')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ./
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('2c7da76d2dcc3a16e0f553e3a4d4d34b')