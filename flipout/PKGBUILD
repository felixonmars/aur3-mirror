# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=flipout
pkgver=1.1
pkgrel=5
pkgdesc="FlipOut is a breakout game with physics.Instead, the paddle can be "flipped" to strike the ball upwards, much like the flippers in a pinball machine."
arch=('i686')
url="http://www.tdb.fi/flipout.shtml"
license=('GPL')
depends=('devil' 'libpng' 'openal' 'libsigc++')
source=(http://www.tdb.fi/files/flipout-$pkgver-bin.tar.gz flipout.sh flipout.desktop flipout.png )
md5sums=('8a6e5ef53322701fee8522b150d32b2c'
         '2114037c76eb3d59c59d58286797c347'
         '0c82c0b54077507d856befb1e033ceda'
         'e96f0bcbd54e7146cc1af8c496ef8f93')


package() {

  cd $startdir/src/$pkgname
  install -d $startdir/pkg/usr/bin && \
  install -d $startdir/pkg/usr/share/applications && \
  install -m 755 -o 0 -g 0 ../flipout.sh $startdir/pkg/usr/bin
  mv $startdir/pkg/usr/bin/flipout.sh $startdir/pkg/usr/bin/flipout
  install -d $startdir/pkg/usr/share/flipout && \
  cp -r * $startdir/pkg/usr/share/flipout
  cp ../flipout.desktop  $startdir/pkg/usr/share/applications/
  cp ../flipout.png  $startdir/pkg/usr/share/flipout
}
