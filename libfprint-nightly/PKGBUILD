# Maintainer: Roberto Vanto <r.vanto@gmail.com>

pkgname=libfprint-nightly
pkgver=20081125
_pkgrev=e5da34e8
pkgrel=2
pkgdesc="library for fingerprint scanner support in applications"
url="http://reactivated.net/fprint/wiki/Main_Page"
license=('LGPL')
groups=('fprint')
depends=('libusb-beta>=0.9.4' 'imagemagick' 'libtool')
conflicts=('libfprint')
arch=('i686' 'x86_64')
install=fprint.install
source=(http://projects.reactivated.net/snapshots/libfprint/libfprint-$pkgver-$_pkgrev.tar.bz2
        50-fprint.rules)
options=(libtool)
md5sums=('2659b32c7b417476d652a44b27e29086' '2c4021484509498fb17bdbe0b6d85ebf')
build() {
  cd $startdir/src/libfprint-$pkgver-$_pkgrev
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -D -m644 $startdir/src/50-fprint.rules $startdir/pkg/etc/udev/rules.d/70-fprint.rules
}
