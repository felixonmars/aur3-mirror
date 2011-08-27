# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=kmid2
pkgver=2.4.0
pkgrel=1
pkgdesc="MIDI/Karaoke player for KDE4"
url="http://userbase.kde.org/KMid2"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdelibs' 'alsa-lib' 'phonon' 'drumstick')
makedepends=('cmake' 'automoc4')
optdepends=('timidity++')
conflicts=('kmid-svn')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgver}/kmid-${pkgver}.tar.bz2)
md5sums=('3abf39fdb31862d4d695613e8835bf00')

build() {
	  cd ${srcdir}/kmid-$pkgver
	  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	  make
	  make DESTDIR=${pkgdir} install
	}
