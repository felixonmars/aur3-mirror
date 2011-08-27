# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Devin Smittle <dzs6w3@gmail.com>
pkgname=libsnewpy  
pkgver=0.0.1.8
pkgrel=3
pkgdesc="libsnewpy is a library to help with writing game utilities; right now only Warcraft III is supported"
url="http://snewpy.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'libx11' 'libxtst' 'curl' 'gstreamer0.10' 'libpcap' 'geoip' 'liboping' 'xosd' 'procps')
makedepends=('pkgconfig' 'make')
conflicts=()
replaces=()
backup=()
install=
source=($pkgname-$pkgver.tar.gz)
md5sums=('33e86417eeebe6752017e41eb2c8579b')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}