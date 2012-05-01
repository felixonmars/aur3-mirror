# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=ahorcapy
pkgver=0.9.1
pkgrel=1
pkgdesc="a Hangman game version"
arch=(any)
url="http://sonlinkblog.blogspot.com/p/ahorcapy.html"
license=('GPL3')
groups=()
depends=('python' 'ncurses')
source=(http://dl.dropbox.com/u/58286032/programas/${pkgname}-${pkgver}.tar.gz)
md5sums=('02a816f2940b6363c6ae367f9a631184')

package() {
  cd "${srcdir}"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/locale
  mkdir -p $pkgdir/usr/share/ahorcapy
  
  install -m755 ${pkgname}.py $pkgdir/usr/bin/$pkgname
  sed -i "s/COPYING/\/usr\/share\/ahorcapy\/COPYING/g" $pkgdir/usr/bin/ahorcapy
  sed -i "s/words.txt/\/usr\/share\/ahorcapy\/words.txt/g" $pkgdir/usr/bin/ahorcapy
  sed -i "s/lang/\/usr\/share\/locale/g" $pkgdir/usr/bin/$pkgname
  
  install -m644 COPYING $pkgdir/usr/share/ahorcapy
  install -m644 words.txt $pkgdir/usr/share/ahorcapy

  cp lang/* -r $pkgdir/usr/share/locale/

}
