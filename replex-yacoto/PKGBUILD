# Contributer: Franz Burgmann <f dot burgmann at gmail dot com>
# Contributer: Sebastian Sareyko <public@nooms.de>
# Contributer: Ermanno <erm67@yahoo.it>

pkgname=replex-yacoto
pkgver=0.1.6.8
pkgrel=2
pkgdesc="Remultiplex an MPEG2 TS into a PS for DVD, includes yacoto patch"
url="http://www.metzlerbros.org/dvb/index.html"
depends=()
conflicts=('replex')
provides=('replex')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://www.metzlerbros.org/dvb/replex-$pkgver.tar.gz)
md5sums=('de02c1b55bc7863f811adffe611f1c71')

build() {
  mkdir -p $startdir/pkg/{bin,lib}
 
  if [ "$CARCH" = "x86_64" ]; then
    cp -r $startdir/replex $startdir/pkg/bin || return 1
    cp -r $startdir/libreplex.a $startdir/pkg/lib || return 1
  fi
  if [ "$CARCH" = "i686" ]; then
    cd $startdir/src/replex-$pkgver
    cat $startdir/replex-0.1.6.8-yacoto.diff |patch -p1
    /usr/bin/make || return 1
    /usr/bin/make DESTDIR=$startdir/pkg install
  fi
  
  cd $startdir/src/replex-$pkgver
  mkdir -p $pkgdir/usr/share/doc/$pkgname || return 1
  cp COPYING $pkgdir/usr/share/doc/$pkgname || return 1  
  cp CHANGES $pkgdir/usr/share/doc/$pkgname || return 1
  cp README $pkgdir/usr/share/doc/$pkgname || return 1
}
