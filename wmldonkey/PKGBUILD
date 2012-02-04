# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
pkgname=wmldonkey
pkgver=0.3.4
pkgrel=2
pkgdesc="A WindowMaker dockapp that gives various informations about the downloading files in mldonkey"
arch=('i686')
url="http://wmldonkey.sourceforge.net"
license="GPL"
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b1f82d5eef92b007814817cbdcaa1ca6')
install=wmldonkey.install

build()  {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr/
  make || return 1
  make DESTDIR=$startdir/pkg install
}
#
