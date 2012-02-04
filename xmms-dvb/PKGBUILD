# Contributor: AndyRTR <andreas.radke@freenet.de>
pkgname=xmms-dvb
pkgver=0.5.0
pkgrel=2
pkgdesc="DVB plugin for XMMS"
arch=('i686')
url="http://xmms-dvb.sourceforge.net/"
license="GPL"
depends=(xmms lame)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://kent.dl.sourceforge.net/project/xmms-dvb/xmms-dvb/xmms-dvb-0.5.0/$pkgname-$pkgver.tar.gz)
md5sums=('29126805ae87f10afab38e5b1c92ad5b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
