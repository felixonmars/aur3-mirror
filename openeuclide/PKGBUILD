#Contributor: Cilyan Olowen <ganar@gmail.com>
#Contributor: Tutku DALMAZ <tutkudalmaz@gmail.com>
pkgname=openeuclide
pkgver=0.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="OpenEuclide is a 2D geometry software"
url="http://coulon.publi.free.fr/openeuclide/"
license=('GPL')
depends=('gtk2')
source=(http://dl.sourceforge.net/sourceforge/openeuclide/$pkgname-$pkgver.tgz \
        openeuclide-0.5-fix-not-defined.patch)
md5sums=('036332062fdebed576581ddd21d4b185'
         'c30ce2791f1e3ac7c7eb59f063b7db7d')

build() {
  cd $startdir/src/$pkgname
  # Add some #include <string.h> where needed
  patch -p1 -i $startdir/src/openeuclide-0.5-fix-not-defined.patch || return 1
  # Restore openeuclide.desktop from saved file
  cp openeuclide.desktop~ openeuclide.desktop || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
