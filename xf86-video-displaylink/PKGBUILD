# Contributor: Johannes Schriewer <jschriewer@gmail.com>

pkgname=xf86-video-displaylink
pkgver=0.3
pkgrel=1
pkgdesc="X.org DisplayLink USB Video Driver"
arch=(i686 x86_64)
url="http://libdlo.freedesktop.org/wiki/xf86-driver-displaylink"
license=('LGPL')
depends=(libusb libdlo)
options=(!distcc)
source=(http://projects.unbit.it/downloads/udlfb-0.2.3_and_xf86-video-displaylink-$pkgver.tar.gz
	xorg-abi-fix.patch)
md5sums=('c2aedc8130c2e4d52e334b6804ab70da' 'aa93bb7935037decc3932271947156ae')

build() {
  cd "$srcdir/$pkgname"

  patch -p1 <../xorg-abi-fix.patch
  ./configure --prefix=/usr --mandir=/usr/share/man

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
