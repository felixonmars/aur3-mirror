# $Id: PKGBUILD,v 1.6 2004/07/28 12:37:03 dorphell Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=ispell-british
pkgver=3.3.02
pkgrel=2
pkgdesc="British English dictionary for ispell"
arch=('i686' 'x86_64')
url="http://ficus-www.cs.ucla.edu/geoff/ispell.html"
license=("BSD")
makedepends=('ncurses')
options=('!makeflags')
source=(http://fmg-www.cs.ucla.edu/geoff/tars/ispell-${pkgver}.tar.gz
        license.txt
        ispell-getline-compile-fix.patch)
md5sums=('12087d7555fc2b746425cd167af480fe'
         'bf51b6181b9914dedc266ba970bb7319'
         '0ae49daef92920839308accca87df4a9')

build() {
  cd "${srcdir}/ispell-${pkgver}"
  patch -Np0 -i ../ispell-getline-compile-fix.patch || return 1
  sed -i 's/#undef USG/#define USG/' local.h.linux
  sed -i 's|/usr/local|/usr|' local.h.linux
  sed -i 's|/lib|/lib/ispell|' local.h.linux
  cp local.h.linux local.h
  chmod +w local.h
  echo '#define LANGUAGES "{british,MASTERDICTS=british.med,HASHFILES=britishmed.hash,EXTRADICT=}"' >> local.h
  echo '#define MASTERHASH "britishmed.hash"' >> local.h
  make TMPDIR=/tmp all || return 1

  mkdir -p "${pkgdir}/usr/lib/ispell"
  cp languages/british/britishmed.hash "${pkgdir}/usr/lib/ispell"
  cd "${pkgdir}/usr/lib/ispell"
  ln -s britishmed.hash british.hash

  install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
