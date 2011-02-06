# Contributor: Andreas Schönfelder <passtschu@freenet.de>
pkgname=libopensync-plugin-sunbird
pkgver=0.22
pkgrel=1
pkgdesc='Sunbird plugin for OpenSync'
url='http://www.opensync.org/'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libopensync')
source=(http://www.opensync.org/attachment/wiki/download/$pkgname-$pkgver.tar.bz2?format=raw)
options=('!libtool')
md5sums=('c23d0cc6c128831c8a129d0b21aa4fe9')

build() 
{
  cd ${startdir}/src
  mv ${pkgname}-${pkgver}.tar.bz2?format=raw ${pkgname-$pkgver}.tar.bz2
  tar xjf ${pkgname}-${pkgver}.tar.bz2
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  
  # add compatibility for inline functions
  sed -i -e "s/^CFLAGS = /CFLAGS = -fgnu89-inline /g" src/Makefile
  
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
