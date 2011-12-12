pkgname=rhapsody
pkgver=0.28b
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Rhapsody is a text console IRC client for Unix operating systems. It is small, fast, portable and easy to use, yet it is full featured. The thing that separates it from the crowd is its intuitive menu driven user interface."
url="http://rhapsody.sourceforge.net/"
license="GPL"
depends=('ncurses')
source=(http://downloads.sourceforge.net/project/rhapsody/rhapsody/Rhapsody%20IRC%200.28b/rhapsody_0.28b.tgz)
md5sums=('0792de636a2625a826491e387fcb1305')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure -i /usr/bin -d /usr/share/doc/rhapsody
  make clean || return 1
  make INSTALLPATH=$startdir/pkg/usr/bin INSTDOCSPATH=$startdir/pkg/usr/share/doc/rhapsody install
}
