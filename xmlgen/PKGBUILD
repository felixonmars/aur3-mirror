# Maintainer: Lazaros Koromilas <koromilaz@gmail.com>
pkgname=xmlgen
pkgver=0.96
pkgrel=1
pkgdesc="The Data Generation Tool"
arch=('any')
url="http://www.xml-benchmark.org/"
license=('custom')
_baseurl="http://www.ins.cwi.nl/projects/xmark/Assets"
source=("$_baseurl/unix.c"
        "$_baseurl/xmlquery.txt"
        "$_baseurl/auction.dtd")
md5sums=('a27a4fbf3f10d29a43f965a640eedba1'
         '082ac5527fc2c7d8c7acaaca29d78f6c'
         '7e30806069255874713f6dfaa4327dff')

build() {
  cd $srcdir
  cc unix.c -o $pkgname
}

package() {
  cd $srcdir
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
  install -d $pkgdir/usr/share/$pkgname
  install -m644 xmlquery.txt $pkgdir/usr/share/$pkgname/
  install -m644 auction.dtd $pkgdir/usr/share/$pkgname/
  install -d $pkgdir/usr/share/licenses/$pkgname
  echo "The source code of the data generator XMLgen is public domain.
See ${url}downloads.html" > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
