# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=gdk-pixbuf-psd
pkgver=0.1.0
pkgrel=1
pkgdesc="A GdkPixbuf loader for the PSD (Adobe Photoshop) file format"
arch=('i686' 'x86_64')
url="http://cgit.sukimashita.com/gdk-pixbuf-psd.git/"
license=('LGPL2.1')
depends=('gdk-pixbuf2')
options=('!libtool')
install=${pkgname}.install
source=(http://cgit.sukimashita.com/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0ca133b1f56637f374baca585382fbcd')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}

