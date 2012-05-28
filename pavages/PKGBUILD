# Author: Patrick Brisbin <pbrisbin@gmail.com>
# Contributor : Biginoz < biginoz at free fr>
pkgname=pavages
pkgver=2.0
pkgrel=1
pkgdesc="presentation of 17 plan Pavages "
arch=('any')
url="http://pascal.peter.free.fr"
depend=('pyqt')
source=(http://launchpad.net/pavages/$pkgver/$pkgver/+download/Pavages$pkgver.tar.gz)
license="GPL2" 


build() { 
  install -d $pkgdir/usr/share/$pkgname
    sed -i 's/python/python2/'  $srcdir/Pavages/Pavages.pyw
      sed -i 's/CHEMIN\/Pavages/usr\/share\/pavages/'  $srcdir/Pavages/Pavages.desktop

  cp  -r $srcdir/Pavages/* $pkgdir/usr/share/$pkgname

  
}
md5sums=('c2933179714589e350c535fba12030db')
