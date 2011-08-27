# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=doldaconnect
pkgver=0.2
pkgrel=1 
pkgdesc="Dolda Connect is a client for the Direct Connect p2p-filesharing network"
url="http://www.dolda2000.com/~fredrik/doldaconnect/"
license=('GPL')
makedepends=()
depends=('bzip2' 'gtk2' 'pam')
source=(http://www.dolda2000.com/~fredrik/${pkgname}/${pkgname}-${pkgver}.tar.gz)
options=('nolibtool')
md5sums=('f95f5909dd7758c8d853bc2314506bf1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --without-krb5 --enable-gtk2ui \
  --enable-gtk2pbar --without-guile || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
