# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Former Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gramofile
pkgver=1.6
pkgrel=2
pkgdesc="For putting the sound of, for example gramophone records on CDs"
arch=('i686' 'x86_64')
source=("gramofile-1.6-64bit.patch" \
"http://www.opensourcepartners.nl/~costar/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('40aee998927430b81f1b483ccaed615c' '986c86c6fa17c064bc17c2936cc833e0')
license=('GPL2')
url="http://www.opensourcepartners.nl/~costar/gramofile/"

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i -e "s/CFLAGS = -Wall -O2 -DTURBO_MEDIAN -DTURBO_BUFFER/CFLAGS \= -Wall `echo ${CFLAGS}` -DTURBO_MEDIAN -DTURBO_BUFFER/" Makefile
  if [ "$CARCH" = "x86_64" ]; then
    patch -Np0 -i ../gramofile-1.6-64bit.patch || return 1
    sed -i -e "s/-DREDHAT50//" bplaysrc/Makefile
  fi || return 1
  make || return 1
  install -Dm755 gramofile $pkgdir/usr/bin/gramofile || return 1
  install -m755 bplay_gramo brec_gramo $pkgdir/usr/bin/ || return 1
}
