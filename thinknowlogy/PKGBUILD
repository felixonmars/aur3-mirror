# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=Thinknowlogy
pkgname=thinknowlogy
pkgver=2011r3
pkgrel=1
pkgdesc="An artificial language system (by Design), designed to be intelligent."
arch=(i686 x86_64)
url="http://mafait.org/"
license=('GPL2')
source=("${url}files/download/${_pkg}${pkgver}.zip")
md5sums=('5253db927161ef278cc640fdba762d3a')

build() {
  cd "$srcdir/$_pkg$pkgver"

  # Fix data paths
  sed -i "s|data/|/usr/share/$pkgname/&|g" \
         source/C++/Constants.h data/startup/startup.txt

  # strip useless VS stuff
  sed -i "/conio\.h/d;s|_getch|getchar|" source/C++/Presentation.cpp

  g++ source/C++/*.cpp -o $pkgname
}

package() {
  cd "$srcdir/$_pkg$pkgver"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # datas
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a data docs "$pkgdir/usr/share/$pkgname"

  # removing non UTF-8 paths
  cd "$pkgdir/usr/share/$pkgname/docs/theory"
  rm -rf N* P* D* F* Es*

  # converting dos to unix text files
  sed -i "s|\r||" "$pkgdir"/usr/share/thinknowlogy/data/info/English/*.txt
}

# vim:set ts=2 sw=2 et:
