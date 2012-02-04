# Contributor: Fabio 'AkiraYuki' Memoli <akirayuki@fastwebnet.it>

pkgname=vumeter
pkgver=0.9.2
pkgrel=1
pkgdesc="Analog VUmeter plugin for XMMS"
arch=('i686')
url="http://vumeterplugin.sourceforge.net"
license=('GPL')
depends=('xmms' 'gtk' 'gdk-pixbuf')
source=(http://downloads.sourceforge.net/vumeterplugin/$pkgname-$pkgver.tar.gz)
md5sums=('ed283a24226d7044265fff6a96533b22')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  mkdir -p $startdir/pkg/usr/share/xmms/VU_Meter_skins
  cp -R $startdir/src/$pkgname-$pkgver/skins/* $startdir/pkg/usr/share/xmms/VU_Meter_skins/
}

