# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gtkhx
pkgver=0.9.4
pkgrel=2
pkgdesc="A GTK+ Hotline Client based off of Hx."
url="http://gtkhx.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk' 'gdk-pixbuf' 'openssl')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz \
files.c.patch)
md5sums=('d61d7dc2df66d934464e0bb8cd0fe45e' 'f87038c3c6a6b30018c2d8939f7f90e6')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p0 < ${srcdir}/files.c.patch
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

