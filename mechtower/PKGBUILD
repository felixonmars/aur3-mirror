# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=mechtower
pkgver=1.0.1
pkgrel=2
pkgdesc="Mechanical Tower is a tower defense game."
arch=('any')
url="http://www.tdb.fi/mechtower.shtml"
license=('GPL')
depends=('devil' 'libpng' 'openal' 'libsigc++' 'libpng12')
source=(http://www.tdb.fi/files/$pkgname-$pkgver-bin.tar.gz mechtower.sh  
mechtower.desktop mechtower-failsafe.desktop mechtower.png )

md5sums=('3923ff433315378c2b8e09b1cafbd0fa'
         '0c7b3dd4ddd541b921af980f5804c7f3'
         '9435ff406a1b39e0b4347b3b0aa9bb77'
         '25eee3e4d7b3c48767c044edae163258'
         '19907ff5a64eaecaf453d9ca5caf6e6b')


package() {

  cd $startdir/src/mechtower
  install -d $startdir/pkg/usr/bin && \
  install -d $startdir/pkg/usr/share/applications && \
  install -m 755 -o 0 -g 0 ../mechtower.sh $startdir/pkg/usr/bin
  mv $startdir/pkg/usr/bin/mechtower.sh $startdir/pkg/usr/bin/mechtower
  install -d $startdir/pkg/usr/share/mechtower && \
  cp -r * $startdir/pkg/usr/share/mechtower
  cp ../mechtower.desktop  $startdir/pkg/usr/share/applications/
    cp ../mechtower-failsafe.desktop  $startdir/pkg/usr/share/applications/
  cp ../mechtower.png  $startdir/pkg/usr/share/mechtower
}
