# Contributor: Robson Roberto Souza Peixoto <robsonpeixoto@gmail.com>
_pkgname=CAL9000
pkgname=cal9000
pkgver=2.0
pkgrel=1
pkgdesc="A collection of web application security testing tools."
arch=('i686' 'x86_64')
url="http://www.owasp.org/index.php/Category:OWASP_CAL9000_Project"
license=('GPL')
depends=('firefox')
source=(http://www.digilantesecurity.com/CAL9000/files/CAL9000.zip cal9000.sh)
md5sums=('bf0745264305aee484ad3892b5fa627d'
         'fa134f60126df0803f8db9254dee7fb0')

build() {
  mkdir -p "$pkgdir/usr/share"
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  mv $srcdir/$_pkgname $pkgdir/usr/share/

}

# vim:set ts=2 sw=2 et:
