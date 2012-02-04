#Contributor: Johannes Martin <honzor@gmx.net>
pkgname=etktab	
pkgver=3.2
pkgrel=1
arch=('i686' 'x86_64')
license=('Artistic')
pkgdesc="ASCII Guitar tablature Software"
url="http://etktab.sourceforge.net/"
depends=(tk)
source=(http://dl.sourceforge.net/sourceforge/etktab/$pkgname-$pkgver.tar.gz)
md5sums=(9964454c30f31bfc00da839501bd6833)

build() {
  cd $startdir/src/eTktab-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  cp eTktab $startdir/pkg/usr/bin/
}
