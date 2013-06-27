# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=ahorcapy
pkgver=0.9.2
pkgrel=1
pkgdesc="a Hangman game version"
arch=(any)
url="http://sonlinkblog.blogspot.com/p/ahorcapy.html"
license=('GPL3')
groups=()
depends=('python' 'python2-urwid')
source=(http://dl.dropbox.com/u/58286032/programas/${pkgname}-${pkgver}.tar.gz)
md5sums=('7334b4f4fba319a70462da0032a134f8')

package() {
  cd "${srcdir}"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/locale
  mkdir -p $pkgdir/usr/share/ahorcapy

  install -m755 ${pkgname}.py $pkgdir/usr/bin/$pkgname
  sed -i "s/COPYING/\/usr\/share\/ahorcapy\/COPYING/g" $pkgdir/usr/bin/ahorcapy
  sed -i "s/lists\//\/usr\/share\/ahorcapy\/lists\//g" $pkgdir/usr/bin/ahorcapy
  sed -i "s/lang/\/usr\/share\/locale/g" $pkgdir/usr/bin/$pkgname

  install -m644 COPYING $pkgdir/usr/share/ahorcapy
  cp -r lists $pkgdir/usr/share/ahorcapy/

  cp lang/* -r $pkgdir/usr/share/locale/

}
