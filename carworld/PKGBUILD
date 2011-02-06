# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jacek Poplawski <jacekpoplawski@gmail.com> 

pkgname=carworld
pkgver=0.245.1
pkgrel=3
pkgdesc="driving simulator with physics"
arch=('any')
url="http://carworld.sourceforge.net/"
license=('GPL')
depends=(sdl mesa libgl)
source=(http://downloads.sourceforge.net/sourceforge/carworld/carworld-$pkgver.zip carworld)
md5sums=('2db46a5957d38bbc35c6e6cb2702d157' '81eaf6dfbbb3ef69b21ff9c700f90570')

build() {

  cd $startdir/src/
  make || return 1


}

package () {
  cd $startdir/src/
  install -d $startdir/pkg/usr/bin && \
  install -m 755 -o 0 -g 0 ../carworld $startdir/pkg/usr/bin
  install -d $startdir/pkg/usr/share/carworld/data && \
  install -m 755 -o 0 -g 0 carworld $startdir/pkg/usr/share/carworld && \
  cp -r data/* $startdir/pkg/usr/share/carworld/data
}
