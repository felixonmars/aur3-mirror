# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: detto <detto-brumm@freenet.de>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>

pkgname=gtk-engine-murrine-ubuntu
pkgver=0.60.1
pkgrel=5
pkgdesc="GTK2 engine to make your desktop look like a 'murrina'. Sources from ubuntu archives."
arch=('i686' 'x86_64')
url="http://www.cimitan.com/murrine/"
license=('GPL')
depends=('gtk2')
conflicts=('gtk-engine-murrine' 'gtk-engine-murrine-svn')
makedepends=('pkgconfig' 'intltool')
source=(https://launchpad.net/ubuntu/intrepid/+source/gtk2-engines-murrine/0.60.1/+files/gtk2-engines-murrine_0.60.1.tar.gz )
md5sums=('b72931ed712c187b288ccaeb896f9917')
options=(!libtool)

build() {
  cd $startdir/src/gtk2-engines-murrine-$pkgver
  ./configure --prefix=/usr --enable-animation
  make || return 1
  make DESTDIR=$startdir/pkg install

}
