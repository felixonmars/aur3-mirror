pkgname=gtk3-engine-solidity
pkgver=0.4
pkgrel=1
pkgdesc="Solidity theme engine for GTK3"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php?content=142331"
license=('GPL')
makedepends=('vala' 'gcc' 'make')
depends=('gtk3')
source=(http://gnome-look.org/CONTENT/content-files/142331-solidity-${pkgver}.tar.bz2)
md5sums=('ce2894e0b3c63f635c03c2ba27c1212f')

build(){
  cd "$srcdir/source/gtk3"
   autoreconf -ivf
   ./configure --prefix=/usr
   make
}

package() {
  cd "$srcdir/source/gtk3"

  make DESTDIR="$pkgdir/" install

  cd "$srcdir/themes"
  mkdir -p "$pkgdir/usr/share/themes/"
  mv "solidity/" "$pkgdir/usr/share/themes/"

  mv "solidity dark/" "$pkgdir/usr/share/themes/"
  chmod -R 755 "$pkgdir/usr/share/themes/"
}
