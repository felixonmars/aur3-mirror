# Author & maintainer: Bohdan Turkynewych <tb0hdan@gmail.com>
# 

pkgname=sqtop
_distname=sqtop
pkgver=20101007
pkgrel=1
pkgdesc="sqtop is a console applicaton to display information about currently active client connections for a Squid proxy in a convenient way."
arch=(i686 x86_64)
url="http://code.google.com/p/sqtop/"
depends=('squid')
makedepends=('squid')

license=('GPL')
source=(http://sqtop.googlecode.com/files/${_distname}-2010-10-07.tar.bz2)
sha256sums=('0c3b1ae5daca128ffad6890088a4461c4624c624daef968a96411c42d0afaf63')

build() {
   cd ${srcdir}/${_distname}-2010-10-07
      ./configure --prefix=/usr --sysconfdir=/etc/ 
   make
}

package() {
  cd ${srcdir}/${_distname}-2010-10-07
  make DESTDIR=${pkgdir} install
}
