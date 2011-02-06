# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=livret
pkgver=0.2
pkgrel=2
pkgdesc="Booklet is a small freeware program written in Java for creating small books from a PDF document. Drops from a source PDF file containing two files the fronts and backs ready to be printed and stapled. "
arch=('i686')
url="http://brunetton.tuxfamily.org/index.php?n=Main.Livret"
license=('GPL')
depends=('java-runtime')
source=( http://brunetton.tuxfamily.org/progs/$pkgname-$pkgver-all_inclusive.tar livret)
md5sums=('161df70b630da0803266304c38b0437b'
         '7ee64eb5d445c99aac2d3affaf3baa11')


package() {


  install -d $pkgdir/usr/share/java/$pkgname
  install -d $pkgdir/usr/bin
  cp  $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/java/$pkgname
  cp  $srcdir/livret $pkgdir/usr/bin
}
