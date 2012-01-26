# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=ihatethecashew-plasmoid
pkgver=0.4
pkgrel=2
pkgdesc="A plasmoid that remove the cashew"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/I+HATE+the+Cashew?content=91009"
license=('GPL2')
depends=('kdelibs')
makedepends=('automoc4' 'cmake')
source=("http://www.kde-look.org/CONTENT/content-files/91009-iHateTheCashew-4.4.tbz"
        "ihtc-fix.patch")
md5sums=('521952f888a4fe8a72969a586743c4b6'
         '2488746e38154cb8b56aab4461dd74c0')

build() {
  cd "$srcdir"/iHateTheCashew

  # KDE 4.6+ fix
  patch -Np0 -i "$srcdir"/ihtc-fix.patch

  rm -rf build
  mkdir build && cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/iHateTheCashew/build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
