# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=speedometer
pkgver=2.8
pkgrel=1
pkgdesc="Measure and display the rate of data across a network connection or data being stored in a file."
arch=('any')
url="http://excess.org/speedometer/"
license=('GPL')
depends=('python2-urwid')
source=(http://excess.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('aa52b9253117523202d6ec8c110344ef')
sha1sums=('70546d98486a42a0eaee0393025e0cea2cb6fe5f')

package() {
   cd $srcdir/$pkgname-$pkgver

   # Speedometer requires Python 2.x:
   sed -i -e 's#/usr/bin/python#/usr/bin/python2#g' $pkgname.py

   install -D -m755 $pkgname.py ${pkgdir}/usr/bin/$pkgname
}

# vim: set ft=sh expandtab ts=3 sw=3 tw=0:
