# maintainer: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=tcl-thread
_realname=thread
pkgver=2.7.0
pkgrel=1
pkgdesc="The Tcl Thread extension"
arch=('i686' 'x86_64')
license=('custom')
url="http://tcl.sourceforge.net/"
depends=('tcl')
source=(http://downloads.sourceforge.net/project/tcl/Thread%20Extension/${pkgver}/${_realname}${pkgver}.tar.gz)
sha1sums=('cd130d22920cee7b0f30bde4878ba5cb3daddf2d')

build() {
  cd ${srcdir}/${_realname}${pkgver}
  
  ./configure --sysconfdir=/etc --prefix=/usr --enable-threads --with-tcl=/usr/lib
  make
}

package() {
  cd ${srcdir}/${_realname}${pkgver}
  
  make DESTDIR=${pkgdir} install
  
  rm -rf ${pkgdir}/usr/bin
  rm -rf ${pkgdir}/usr/include
  
  install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
