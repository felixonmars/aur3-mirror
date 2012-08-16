# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=eleet
pkgver=0.3.3
pkgrel=1
pkgdesc="A screensaver for use with Linux and UNIX, that pays homage to the classicspace trading game of Elite."
url="http://software.amiga-hardware.com/eleet.cgi"
license="GPL"
arch=('i686' 'x86_64')
depends=('sdl_ttf' 'xscreensaver' 'libgl')
makedepends=('make')
optdepends=('kdeartwork-kscreensaver' 'gnome-screensaver')
source=(http://software.amiga-hardware.com/software/${pkgname}-${pkgver}.tar.gz)
md5sums=('3911577a477885b4ba54b48cf7c09c12')
install=eleet.install

build() {
	  cd ${srcdir}/$pkgname-$pkgver
	  unset LDFLAGS
	  ./configure --prefix=/usr --x-includes=/usr/include/X11
	  make 
	  make DESTDIR=${pkgdir} install 
	  mkdir -p ${pkgdir}/usr/share/xscreensaver/config/
	  mkdir -p ${pkgdir}/usr/lib/xscreensaver
	  install xscreensaver/eleet.xml ${pkgdir}/usr/share/xscreensaver/config/
	  cp ${pkgdir}/usr/bin/eleet ${pkgdir}/usr/lib/xscreensaver
	}
